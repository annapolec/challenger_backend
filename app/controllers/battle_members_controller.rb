class BattleMembersController < ApplicationController
  
  def create
    @battle_member = BattleMember.create(battle_member_params)    
    render json: @battle_member
  end

  def destroy
    @battle_member = BattleMember.find(params[:id])
    @battle_member.destroy
    render json: 'ok'
  end

  private

  def battle_member_params
    params.permit(:battle_id, :member_type, :member_id)
  end
end
