class VotesController < ApplicationController
  def create
    @vote = current_user.votes.new(article_id: params[:article_id])

    if @vote.save
      redirect_to article_path(params[:article_id]), notice: 'You voted this post.'
    else
      redirect_to article_path(params[:article_id]), alert: 'You cant vote this post.'
    end
  end

  def destroy
    vote = Vote.find_by(id: params[:id], user: current_user, article_id: params[:article_id])
    if vote
      vote.destroy
      redirect_to article_path(params[:article_id]), notice: 'You disliked a post.'
    else
      redirect_to article_path(params[:article_id]), alert: 'You cant dislike a post without like.'
    end
  end
end
