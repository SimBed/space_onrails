class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  private

    # Confirms a logged-in user.
    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end
    
    # Confirms an admin user.
    def admin_user
      #previously current_user.admin? (but returns a nil error when testing (without logging in) as current_user nil in this case
      redirect_to(root_url) unless current_user.try(:admin?)
    end    
end

