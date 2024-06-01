class VotesController < ApplicationController
  before_action :find_topic
  before_action :require_user

  def create
    vote = @topic.votes.new(user: current_user)
    if vote.save
      redirect_to topic_path(@topic), notice: 'Voted successfully.'
    else
      redirect_to topic_path(@topic), alert: 'You have already voted for this topic.'
    end
  end

  def destroy
    vote = @topic.votes.find(params[:id])
    vote.destroy
    redirect_to topic_path(@topic), notice: 'Vote removed successfully.'
  end

  private

  def find_topic
    @topic = Topic.find(params[:topic_id])
  end
end
