class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user and user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:success] = "Welcome #{user.full_name}, you've logged in."
      redirect_to root_path
    else
      flash[:danger] = "There is something wrong with your email or password"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:danger] = "You've logged out."
    redirect_to root_path
  end
end