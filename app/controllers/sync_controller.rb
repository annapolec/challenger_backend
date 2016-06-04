class SyncController < ApplicationController
  def show
    @user = User.find(params[:user_id])
    @battles = @user.battles
    render json: @battles
  end
end
