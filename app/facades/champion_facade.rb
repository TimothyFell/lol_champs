class ChampionFacade

  def initialize(params)
    @params = params
  end

  def champs
    if @params["champion"]
      Champion.where(["name LIKE ?", "%#{@params["champion"].downcase}%"]).order(:name)
    else
      Champion.all.order(:name)
    end
  end

end
