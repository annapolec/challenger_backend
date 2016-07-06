class BattlesController < ApplicationController
  before_action :set_battle, only: [:show, :edit, :update, :destroy]

  def create
    @battle = Battle.new(battle_params)
    @battle_member = BattleMember.new(battle_id: @battle.id, member_id: battle_params[:owner_id], member_type: "User")
    if @battle.save && @battle_member.save 
      respond_to do |format|
        format.html { redirect_to @battle }
        format.json { render json: @battle }
      end
    end    
  end

  def index
    @battles = current_user.battles
    @battle = Battle.new
    respond_to do |format|
      format.html
      format.json { render json: @battles }
    end
  end

  def show
    @challenge = @battle.challenges.new
    @battle_member = BattleMember.new
  end

  def edit
  end

  def update
    if @battle.update_attributes(battle_params)
      respond_to do |format|
        format.html { redirect_to @battle }
        format.json { render json: @battle }
      end
    else
      render action: 'edit'
    end
  end

  def destroy
    if @battle.destroy
      respond_to do |format|
        format.html { redirect_to battles_path }
        format.json { render json: { stauts: 200 }.to_json }
      end
    end
  end

  private

  def set_battle
    @battle = Battle.find(params[:id])
  end

  def battle_params
    params.require(:battle).permit(:name, :owner_id, :mode)
  end
end
