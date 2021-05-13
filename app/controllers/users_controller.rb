class UsersController < ApplicationController
  include UsersHelper

  before_action :same_user?, only: [:show]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:current_user] = @user.id
      redirect_to @user, notice: 'Sucessful Sign Up'
    else
      redirect_to new_user_path, alert: 'User already exist'
    end
  end

  def show
    @user = User.find(params[:id])
    @my_articles = @user.authored_articles
    @voted_articles = @user.voted_articles
  end

  private

  def user_params
    params.require(:user).permit(:name)
  end
end
