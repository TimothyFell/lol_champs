class UsersController < ApplicationController

  def new
    if current_user
      flash[:info] = 'You are already logged in'
      redirect_to root_path
    else
      @user = User.new
    end
  end

  def create
    if current_user
      flash[:info] = 'You are already logged in'
      redirect_to root_path
    else
      user = User.new(user_params)
      if user.save
        session[:user_id] = user.id
        redirect_to(root_path)
      end
    end
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

end
