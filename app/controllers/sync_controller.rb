class SyncController < ApplicationController
  def show
    @user = User.find(params[:user_id])
    @battles = @user.battles
    @battle_members = BattleMember.where(battle_id: @user.battles.map { |battle| battle.id })
    @challenges = @user.all_challenges
    @challenge_members = ChallengeMember.where(challenge_id: @user.all_challenges.map { |challenge| challenge.id })
    @users = User.all
    
    render json: { battles: @battles, 
                  battle_members: @battle_members,
                  challenges: @challenges,
                  challenge_members: @challenge_members,
                  users: @users }
  end
end
