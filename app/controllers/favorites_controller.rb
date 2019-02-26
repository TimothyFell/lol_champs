class FavoritesController < ApplicationController

  def index
    if current_user
      @champion_facade = ChampionFacade.new
    else
      flash[:error] = "You need to login or register to favorite champions"
      redirect_to(login_path)
    end

  end

  def create
    champ = Champion.find_by(name: fav_params["name"])
    if current_user && !current_user.favorites.find_by(champion_id:champ.id)
      new_fav = current_user.favorites.new(champion_id: champ.id)
      new_fav.save
      flash[:sucess] = "You've just favorited #{fav_params[:name].titleize}!"
      redirect_to(my_favorites_path)
    elsif current_user && current_user.favorites.find_by(champion_id:champ.id)
      flash[:error] = "You've already favorited that champion, silly!"
      redirect_to(my_favorites_path)
    else
      flash[:error] = "You need to login or register to favorite champions"
      redirect_to(login_path)
    end
  end

  private
    def fav_params
      params.permit(:name)
    end


end
