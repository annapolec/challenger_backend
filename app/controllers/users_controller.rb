class UsersController < ApplicationController

  def login
    if @user = User.find_by(email: params[:email])
      render json: @user
    else
      @user = User.create(params[:email])
      render json: @user
    end
  end
end
