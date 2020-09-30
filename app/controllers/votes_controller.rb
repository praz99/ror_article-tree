class VotesController < ApplicationController
  before_action :logged_in_user
  def create
    @vote = current_user.votes.new(article_id: params[:article_id])
    if @vote.save
      flash[:notice] = 'Thanks for voting up this article'
    else
      flash[:alert] = 'Sorry, you cannot vote this article'
    end
    redirect_back(fallback_location: root_path)
  end

  def destroy
    vote = Vote.find_by(id: params[:id], user: current_user, article_id: params[:article_id])
    if vote
      vote.destroy
      flash[:alert] = 'You down voted this article'
    else
      flash[:alert] = 'You cannot downvote unless you have voted up before!'
    end
    redirect_back(fallback_location: root_path)
  end
end
