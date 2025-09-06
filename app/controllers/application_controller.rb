class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

private
  def current_user
    User.find(session[:user_id]) if session[:user_id]
  end

  def require_signin
    unless currect_user
      redirect_to new_session_url, alert: "Sign in first!"
    end
  end

  helper_method :current_user
end
