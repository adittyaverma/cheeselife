class AuthenticationController < ApplicationController
	before_action :authorize_request, except: :login

  # POST /auth/login
  def login
  	@role, @field = get_role
    @user = User.where(role: login_params[:role], @field => login_params[@field.to_sym]).first
    if @user&.authenticate(login_params[:password])
      token = JsonWebToken.encode(user_id: @user.id)
      time = Time.now + 24.hours.to_i
      render json: { token: token, exp: time.strftime("%m-%d-%Y %H:%M"),
                     username: @user.username }, status: :ok
    else
      render json: { error: 'unauthorized' }, status: :unauthorized
    end
  end

  private

  def login_params

  	defaults = { role: @role }
    params.permit(:email, :password, :username).reverse_merge(defaults)
  end
end
