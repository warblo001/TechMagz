class SessionsController < ApplicationController
  def sign_in; end

  def create
    @user = User.find_by(name: session_params[:name])
    if @user
      session[:current_user] = @user.id
      redirect_to root_path, notice: 'Sign in successfully'
    else
      session[:current_user] = nil
      redirect_to new_user_path, alert: 'User doesn\'t exist'
    end
  end

  def log_out
    session[:current_user] = nil
    redirect_to root_path, alert: 'You Logged out.'
  end

  private

  def session_params
    params.require(:session).permit(:name)
  end
end
