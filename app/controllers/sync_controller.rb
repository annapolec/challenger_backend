class SyncController < ApplicationController
  def show
    @user = User.find(params[:user_id])
    @battles = @user.all_battles
    @battle_members = BattleMember.where(battle_id: @user.all_battles.pluck(:id))
    @challenges = @user.all_challenges
    @challenge_members = ChallengeMembers.where(challenge_id: @user.all_challenges.pluck(:id))
    @users = User.all
    
    render json: { battles: @battles, 
                  battle_members: @battle_members,
                  challenges: @challenges,
                  challenge_members: @challenge_members,
                  users: @users }
  end
end
