class ChallengesController < ApplicationController
  before_action :set_battle
  before_action :set_challenge, only: [:show, :edit, :update, :destroy]

  def new
    @challenge = @battle.challenges.new
    render json: @challenge
  end

  def create
    @challenge = @battle.challenges.create(challenge_params)
    render json: @challenge
  end

  def show
  end

  def index
    @challenges = @battle.challenges
    render json: @challenges
  end

  def edit
  end

  def update
    @challenge.update_attributes(challenge_params)
    render json: @challenge
  end

  def destroy
    @challenge.destroy
    render json: { status: 200 }.to_json   
  end

  private

  def set_battle
    @battle = Battle.find(params[:battle_id])
  end

  def set_challenge
    @challenge = Challenge.find(params[:id])
  end

  def challenge_params
    params.permit(:name, :desc, :points, :battle_id)
  end
end

