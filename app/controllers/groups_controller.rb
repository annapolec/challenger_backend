class GroupsController < ApplicationController
  before_action :set_group, except: [:new, :create, :index]

  def new
    @group = Group.new
  end

  def create
    @group = Group.create(group_params)
    render json: @group
  end

  def index
    @groups = Group.all
    render json: @groups
  end

  def show
  end

  def edit
  end

  def update
    @group.update_attributes(group_params)
    render json: @group
  end

  def destroy
    @group.destroy
    render json: 'ok' 
  end

  private

  def set_group
    @group = Group.find(params[:id])
  end

  def group_params
    params.require(:group).permit(:name)
  end
end

