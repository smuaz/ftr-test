class AdminsController < ApplicationController

  def new
    @admin = Admin.new
  end

  def login_page
    
  end

  def login
    admin = Admin.find_by email: params[:email]
    if admin and admin.authenticate(params[:password])
      if !admin.status.nil?
        session[:admin_id] = admin.id
        flash[:success] = "Welcome back admin, #{admin.name}, you've logged in."
        redirect_to root_path
      else
        flash[:danger] = "Your admin status is pending verifications."
        render :login_page
      end
    else
      flash[:danger] = "There is something wrong with your login. Please contact the system administrator."
        render :login_page
    end
  end

  def create
    @admin = Admin.new(admin_params)

    if @admin.save
      flash[:success] = "Thank you for your registration. Your status of admin is currently pending."
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    session[:admin_id] = nil
    flash[:success] = "You have log out."
    redirect_to root_path
  end

  private

  def admin_params
    params.require(:admin).permit!
  end
end