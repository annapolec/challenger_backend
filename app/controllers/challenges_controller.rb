class ChallengesController < ApplicationController
  before_action :set_battle
  before_action :set_challenge, only: [:show, :edit, :update, :destroy]

  def new
    @challenge = @battle.challenges.new
  end

  def create
    @challenge = @battle.challenges.create(challenge_params)
    if @challenge.save
      redirect_to [@battle, @challenge]
    else
      render action :new
    end
  end

  def show
  end

  def index
    @challenges = @battle.challenges
  end

  def edit
  end

  def update
    if @challenge.update_attributes(challenge_params)
      redirect_to [@battle, @challenge]
    else
      render action :edit
    end
  end

  def destroy
    if @challenge.destroy
      redirect_to battle_challenges_path(@battle)
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
    params.require(:challenge).permit(:name, :desc, :points, :status, :battle_id)
  end
end

