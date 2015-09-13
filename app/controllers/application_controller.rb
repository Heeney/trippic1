class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  helper_method :current_user, :logged_in?
  
  def current_user
    @current_user ||= Traveller.find(session[:traveller_id]) if session[:traveller_id] #Memoisation / reusing instance variables || storing session to current user, wont look again.
    #efficiency
  end
  
  def logged_in? # Checking !! Boolean return
    !!current_user
  end
  
  def require_user
    if !logged_in?
        flash[:danger] = "You must be logged in to perform that action"
        redirect_to :back
    end
  end
  
end
