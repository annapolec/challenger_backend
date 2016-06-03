class BattlesController < ApplicationController
  before_action :set_battle, only: [:show, :edit, :update, :destroy]

  def new
    @battle = Battle.new
  end

  def create
    @battle = Battle.create(battle_params)
    if @battle.save
      redirect_to @battle
    else
      render action :new
    end
  end

  def index
    @battles = Battle.all
  end

  def show
  end

  def edit
  end

  def update
    if @battle.update_attributes(battle_params)
      redirect_to @battle
    else
      render action :edit
    end
  end

  def destroy
    if @battle.destroy
      redirect_to battles_path
    end
  end

  private

  def set_battle
    @battle = Battle.find(params[:id])
  end

  def battle_params
    params.require(:battle).permit(:name)
  end
end
