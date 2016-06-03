class GroupsController < ApplicationController
  before_action :set_group, except: [:new, :create, :index]

  def new
    @group = Group.new
  end

  def create
    @group = Group.create(group_params)
    if @group.save
      redirect_to @group
    else
      render action :new
    end
  end

  def index
    @groups = Group.all
  end

  def show
  end

  def edit
  end

  def update
    if @group.update_attributes(group_params)
      redirect_to @group
    else
      render action :edit
    end
  end

  def destroy
    if @group.destroy
      redirect_to groups_path
    end
  end

  private

  def set_group
    @group = Group.find(params[:id])
  end

  def group_params
    params.require(:group).permit(:name)
  end
end

