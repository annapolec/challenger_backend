class ChallengesController < ApplicationController
  before_action :set_battle
  before_action :set_challenge, only: [:show, :edit, :update, :destroy]

  def create
    @challenge = @battle.challenges.build(challenge_params)
    if @challenge.save
      respond_to do |format|
        format.html { redirect_to @battle }
        format.json { render json: @challenge }
      end
    else
      render action: 'new'
    end
  end

  def show
    @challenge_member = ChallengeMember.new
  end

  def index
    @challenges = @battle.challenges
    respond_to do |format|
      format.html
      format.json { render json: @challenges }
    end
  end

  def edit
  end

  def update
    if @challenge.update_attributes(challenge_params)
      respond_to do |format|
        format.html { redirect_to [@battle, @challenge] }
        format.json { render json: @challenge }
      end
    else
      render action: 'edit'
    end
  end

  def destroy
    if @challenge.destroy
      respond_to do |format|
        format.html {redirect_to @battle }
        format.json { render json: { status: 200 }.to_json }
      end
    end
  end

  private

  def set_battle
    @battle = Battle.find(params[:battle_id])
  end

  def set_challenge
    @challenge = Challenge.find(params[:id])
  end

  def challenge_params
    params.require(:challenge).permit(:name, :desc, :points, :battle_id, :owner_id)
  end
end

