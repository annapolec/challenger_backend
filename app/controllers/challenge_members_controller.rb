class ChallengeMembersController < ApplicationController
  def create
    @challenge_member = ChallengeMember.new(challenge_member_params)    
    if @challenge_member.save
      respond_to do |format|
        format.html
        format.json { render json: @challenge_member}
      end
  end

  def destroy
    @challenge_member = ChallengeMember.find(params[:id])
    if @challenge_member.destroy
      respond_to do |format|
        format.html
        format.json { render json: { status: 200 }.to_json }
      end
    end
  end

  private

  def challenge_member_params
    params.permit(:challenge_id, :member_type, :member_id, :completed)
  end
end
