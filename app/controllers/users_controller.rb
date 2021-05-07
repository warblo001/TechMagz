class UsersController < ApplicationController
  before_action :require_login, only: [:show]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:current_user_id] = @user.id
      redirect_to @user, notice: 'Sucessful Sign Up'
    else
      flash[:alert] = 'User does not exist'
      render :sign_in
    end
  end

  def show
    @user = User.find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:name)
  end

  def require_login
    return if session[:current_user_id]

    flash[:alert] = 'You must be signed in to access this section'
    redirect_to user_sign_in_path
  end
end
