class MenusController < ApplicationController
	before_action :authorize_request
  before_action :check_permission, only: %i[create destroy]
  before_action :find_menu, except: %i[create index]

  def index
    @menus = Menu.all
    render json: @menus, status: :ok
  end

  def show
    render json: @menu, status: :ok
  end

  def create
    @menu = Menu.new(menu_params)
    if @menu.save
      render json: @menu, status: :created
    else
      render json: { errors: @menu.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  def update
    if @menu.update(menu_params)
      render json: @menu, status: :accepted
    else
      render json: { errors: @menu.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  def destroy
    @menu.update(status: false)
  end

  private

  def check_permission
    raise 'Not allowed' if %w(user driver).include?(@current_user.role)
  end

  def find_menu
    @menu = Menu.find_by_id(params[:id])
    rescue ActiveRecord::RecordNotFound
      render json: { errors: 'Menu not found' }, status: :not_found
  end

  def menu_params
  	defaults = { user_id: @current_user.id }
    params.permit(
      :name, :summary
    ).reverse_merge(defaults)
  end
end
