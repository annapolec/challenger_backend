class RankingController < ApplicationController
  def show
    @ranking = RankingService.new.call
  end
end
