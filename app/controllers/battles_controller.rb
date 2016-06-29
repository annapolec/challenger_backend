class BattlesController < ApplicationController
  before_action :set_battle, only: [:show, :edit, :update, :destroy]

  def new
    @battle = Battle.new
  end

  def create
    @battle = Battle.new(battle_params)
    @battle_member = BattleMember.new(battle_id: @battle.id, member_id: battle_params[:owner_id], member_type: "User")
    if @battle.save && @battle_member.save 
      respond_to do |format|
        format.html
        format.json { render json: @battle }
      end
    end    
  end

  def index
    @battles = Battle.all
    respond_to do |format|
      format.html
      format.json { render json: @battles }
    end
  end

  def show
  end

  def edit
  end

  def update
    if @battle.update_attributes(battle_params[:name])
      respond_to do |format|
        format.html
        format.json { render json: @battle }
      end
    else
      render action: 'edit'
    end
  end

  def destroy
    if @battle.destroy
      respond_to do |format|
        format.html 
        format.json { render json: { stauts: 200 }.to_json }
      end
    end
  end

  private

  def set_battle
    @battle = Battle.find(params[:id])
  end

  def battle_params
    params.permit(:name, :owner_id)
  end
end
