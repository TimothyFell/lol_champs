class ChampionsController < ApplicationController
  def index
    @champion_facade = ChampionFacade.new(champ_params(params))
  end

  def show

  end

  def create

  end

  def put

  end

  private
    def champ_params(params)
      params.permit(:champion)
    end
end
