class ItemsController < ApplicationController
	before_action :authorize_request
  before_action :check_permission, only: %i[create destroy]
  before_action :find_item, except: %i[create index]

  def index
    @items = Item.all
    render json: @items, status: :ok
  end

  def show
    render json: @item, status: :ok
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      render json: @item, status: :created
    else
      render json: { errors: @item.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  def update
    if @item.update(item_params)
      render json: @item, status: :accepted
    else
      render json: { errors: @item.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  def destroy
    @item.update(status: false)
  end

  private

  def check_permission
    raise 'Not allowed' if %w(user driver).include?(@current_user.role)
  end

  def find_item
    @item = Item.find_by_id(params[:id])
    rescue ActiveRecord::RecordNotFound
      render json: { errors: 'Item not found' }, status: :not_found
  end

  def item_params
    params.permit(
      :name, :desc, :price, :aval_quantity, :food_type, :cuisine, :menu_id
    )
  end
end
