class ArticlesController < ApplicationController
  def new
    @article = Article.new
  end

  def create
    @article = current_user.articles.build(article_params)
    if @article.save
      redirect_to 
    else
      render :new, notice: 'There was an error creating this article.'
    end
  end

  private 

  def article_params
    params.require(:articles).permit(:)
  end
end
