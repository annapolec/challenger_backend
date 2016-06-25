class BattlesController < ApplicationController
  before_action :set_battle, only: [:show, :edit, :update, :destroy]

  def new
    @battle = Battle.new
  end

  def create
    @battle = Battle.create(battle_params)
    BattleMember.create(battle_id: @battle.id, member_id: battle_params[:owner_id], member_type: "User")
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
   render json: { status: 200 }.to_json
  end

  private

  def set_battle
    @battle = Battle.find(params[:id])
  end

  def battle_params
    params.permit(:name, :owner_id)
  end
end
