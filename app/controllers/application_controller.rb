class ApplicationController < ActionController::Base
  include ApplicationHelper

  helper_method :current_user, :require_login

  def current_user
    User.find(session[:current_user]) if session[:user_id]
    User.find(session[:current_user])
  end

  def require_login
    return if session[:current_user]

    redirect_to user_sign_in_path, alert: 'You must be signed in to access this section'
  end
end
