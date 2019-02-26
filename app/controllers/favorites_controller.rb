class FavoritesController < ApplicationController

  def create
    flash[:error] = "You need to login or register to favorite champions"
    redirect_to(login_path)
  end


end
