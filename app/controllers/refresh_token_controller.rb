class RefreshTokenController < ApplicationController
  def create
    if @user = User.find(params[:user_id])
      @user.update_attribute(:token, params[:token])
      render json: { status: 200 }.to_json
    end
  end
end
