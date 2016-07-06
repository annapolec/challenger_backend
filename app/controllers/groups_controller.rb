class GroupsController < ApplicationController
  before_action :set_group, except: [:create, :index]

  def create
    @group = Group.new(group_params)
    authorize @group
    if @group.save
      GroupUser.create(group_id: @group.id, user_id: current_user.id)
      respond_to do |format|
        format.html { redirect_to @group }
        format.json { render json: @group }
      end
    else
      render action: 'new'
    end
  end

  def index
    @groups = current_user.groups
    authorize @groups
    @group = Group.new
    respond_to do |format|
      format.html
      format.json { render json: @groups }
    end
  end

  def show
    @group_user = GroupUser.new
  end

  def edit
  end

  def update
    if @group.update_attributes(group_params)
      respond_to do |format|
        format.html { redirect_to @group }
        format.json { render json: @group }
      end
    else
      render action: 'edit'
    end
  end

  def destroy
    if @group.destroy
      respond_to do |format|
        format.html { redirect_to groups_path }
        format.json { render json: { status: 200 }.to_json }
      end
    end
  end

  private

  def set_group
    @group = Group.find(params[:id])
    authorize @group
  end

  def group_params
    params.require(:group).permit(:name)
  end
end

