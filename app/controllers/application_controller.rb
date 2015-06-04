class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user, :logged_in?, :creator?, :admin?

  def current_user
    @current_user ||= (User.find(session[:user_id]) if session[:user_id]) || (Admin.find(session[:admin_id]) if session[:admin_id])
  end

  def logged_in?
    !!current_user
  end

  def admin?
    true if logged_in? and current_user.status == 'active'
  end

  def require_admin
    access_denied unless logged_in? and current_user.status == 'active'
  end

  def creator?(complaint)
    true if (logged_in? and complaint.user == current_user) || admin?
  end

  def require_user
    if !logged_in?
      flash[:danger] = "You must be logged in."
      redirect_to root_path
    end
  end

  def access_denied
    flash[:danger] = "You can't do that"
    redirect_to root_path
  end
end
