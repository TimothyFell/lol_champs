class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    user = User.find_by(email: login_params[:email])
    if user && user.authenticate(login_params[:password])
      session[:user_id] = user.id
      flash[:success] = "You are now logged in!"
      redirect_to root_path
    else
      flash[:error] = 'Something went wrong!'
      redirect_to(login_path)
    end
  end

  private
    def login_params
      params.permit(:email, :password)
    end

end
