class UsersController < ApplicationController

  def login
    if @user = User.find_by(email: params[:email])
      render json: @user
    else
      @user = User.create(user_params)
      render json: @user
    end
  end

  private

  def user_params
    params.permit(:email)
  end
end
