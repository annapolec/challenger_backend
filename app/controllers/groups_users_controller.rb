class GroupsUsersController < ApplicationController
  def create
    @group_user = GroupUser.new(group_user_params)
    if @group_user.save
      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @users}
      end
    else
      render action: 'new'
    end
  end

  private

  def group_user_params
    params.permit(:group_id, :user_id)
  end
end
