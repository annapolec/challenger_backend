class RefreshTokenController < ApplicationController
  def create
    if @user = User.find(params[:user_id])
      @user.update_attribute(:token, params[:token])
      render status: 200
    end
  end
end
