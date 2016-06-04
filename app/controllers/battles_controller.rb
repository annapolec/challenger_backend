class BattlesController < ApplicationController
  before_action :set_battle, only: [:show, :edit, :update, :destroy]

  def new
    @battle = Battle.new
  end

  def create
    @battle = Battle.create(battle_params)
    BattleMember.create(battle_id: @battle.id, battle_member_type: "User", battle_member_id: battle_members_params[:user_id])
    render json: @battle
  end

  def index
    @battles = Battle.all
    render json: @battles
  end

  def show
  end

  def edit
  end

  def update
    @battle.update_attributes(battle_params[:name])
    render json: @battle
  end

  def destroy
   @battle.destroy   
   render status: 200
  end

  private

  def set_battle
    @battle = Battle.find(params[:id])
  end

  def battle_params
    params.permit(:name)
  end

  def battle_members_params
    params.permit(:user_id)
  end
end
