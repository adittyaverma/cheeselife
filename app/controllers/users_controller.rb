class UsersController < ApplicationController

  def create
    @user = User.new(user_params)
    if @user.save
      token = JsonWebToken.encode(user_id: @user.id)
      time = Time.now + 24.hours.to_i
      render json: { token: token, exp: time.strftime("%m-%d-%Y %H:%M"),
                     username: @user.username }, status: :ok
    else
      render json: { errors: @user.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  private

  def user_params
  	defaults = { role: get_role[0] }
    params.permit(
      :avatar, :name, :username, :email, :password, :password_confirmation
    ).reverse_merge(defaults)
  end
end
