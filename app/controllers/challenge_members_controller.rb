class ChallengeMembersController < ApplicationController
  def create
    @challenge_member = ChallengeMember.create(challenge_member_params)    
    render json: @challenge_member
  end

  def destroy
    @challenge_member = ChallengeMember.find(params[:id])
    @challenge_member.destroy
    render json: { status: 200 }.to_json
  end

  private

  def challenge_member_params
    params.permit(:challenge_id, :member_type, :member_id, :completed)
  end
end
