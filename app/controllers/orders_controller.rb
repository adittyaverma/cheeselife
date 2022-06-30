class OrdersController < ApplicationController
	before_action :authorize_request
  before_action :check_permission, only: %i[create_order]
  before_action :find_orders, only: %i[index show update]

  def index
    render json: @orders, status: :ok
  end

  def show
    @order = @orders.where(id: params[:id])
    raise 'order not found' if @order.blank?
    render json: @order, status: :ok
  end

  def create_order
    @order = Order.new(order_params)
    if @order.create_order(params[:items])
      render json: @order, status: :accepted
    else
      render json: { errors: @order.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  def update
    @order = @orders.where(id: params[:id]).first
    raise 'order not found' if @order.blank?
    if Orders::UpdateOrder.new(@order, update_order_params[:status]).update_order #@order.first.update!(update_order_params)
      render json: @order, status: :accepted
    else
      render json: { errors: @order.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  private

  def check_permission
    raise 'Not allowed' if %w(admin restaurant driver).include?(@current_user.role)
  end

  def find_orders
    @orders = if @current_user.role == 'user'
                @current_user.user_orders
              elsif @current_user.role == 'restaurant'
                @current_user.rest_orders
              end
    rescue ActiveRecord::RecordNotFound
      render json: { errors: 'Order(s) not found' }, status: :not_found
  end

  def update_order_params
    params.permit(
     :status 
    )
  end

  def order_params
  	defaults = { user_id: @current_user.id, status: 'draft' }
    params.permit(
      
    ).reverse_merge(defaults)
  end
end
