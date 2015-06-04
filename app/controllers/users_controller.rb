class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]
  before_action :require_same_user, only: [:edit, :update]
  
  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      if current_user.is_a? Admin
        flash[:success] = "You have created a new user."
        redirect_to new_complaint_path
      else
        session[:user_id] = @user.id 
        flash[:success] = "You are registered."
        redirect_to root_path
      end
    else
      render :new
    end
  end

  def edit 
  end

  def update
    if @user.update(user_params)
      flash[:success] = "Your profile was updated."
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit!
  end

  def set_user
    @user = User.find_by slug: params[:id]
  end

  def require_same_user
    if current_user != @user
      flash[:danger] = "You don't have permission to do that."
      redirect_to root_path
    end
  end
end