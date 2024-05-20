class TopicsController < ApplicationController
  before_action :set_topic, only: [:edit, :update, :destroy]
  before_action :authorize_user, only: [:edit, :update, :destroy]

  def index
    @topics = Topic.includes(:votes).all.sort_by { |topic| -topic.votes.count }
  end

  def new
    @topic = Topic.new
  end

  def create
    @topic = current_user.topics.build(topic_params)
    @topic.votes.build(user: current_user) # Add the owner's vote on creation
    if @topic.save
      redirect_to topics_path, notice: "Topic created successfully."
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @topic.update(topic_params)
      redirect_to topics_path, notice: "Topic updated successfully."
    else
      render :edit
    end
  end

  def destroy
    @topic.destroy
    redirect_to topics_path, notice: "Topic deleted successfully."
  end

  private

  def set_topic
    @topic = Topic.find(params[:id])
  end

  def topic_params
    params.require(:topic).permit(:title, :description, :target_meeting_date)
  end

  def authorize_user
    redirect_to topics_path, alert: "Not authorized." unless @topic.user == current_user
  end
end
