class GroupsController < ApplicationController
  before_action :set_group, except: [:new, :create, :index]

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      respond_to do |format|
        format.html { redirect_to @group }
        format.json { render json: @group }
      end
    else
      render action: 'new'
    end
  end

  def index
    @groups = Group.all
    respond_to do |format|
      format.html
      format.json { render json: @groups }
    end
  end

  def show
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
  end

  def group_params
    params.require(:group).permit(:name)
  end
end

