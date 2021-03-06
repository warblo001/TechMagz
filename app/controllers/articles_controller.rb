class ArticlesController < ApplicationController
  include ArticlesHelper

  before_action :require_login, only: %i[create new]

  def new
    @article = Article.new
  end

  def create
    @article = current_user.authored_articles.build(article_params)
    if @article.save
      create_categories(params[:article][:categories], @article)
      redirect_to article_path(@article), notice: 'Article created succesfully'
    else
      flash[:form_errors] = @article.errors
      redirect_to new_article_path, alert: 'This article can\'t be created'
    end
  end

  def show
    @article = Article.find(params[:id])
    @categories = @article.categories.map(&:name).join(', ')
  end

  private

  def article_params
    params.require(:article).permit(:title, :content, :image)
  end
end
