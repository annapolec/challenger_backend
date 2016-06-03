class UsersController < ApplicationController

  def login
    if @user = User.find_by(email: params[:email])
    else
      @user = User.create(user_params)
    end
    render json: @user
  end

  private

  def user_params
    params.require(:user).permit(:email)
  end
end
