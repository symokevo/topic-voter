class VotesController < ApplicationController
  def create
    topic = Topic.find(params[:topic_id])
    vote = topic.votes.new(user: current_user)

    if vote.save
      redirect_to topics_path, notice: 'Voted successfully.'
    else
      redirect_to topics_path, alert: 'You have already voted for this topic.'
    end
  end
end
