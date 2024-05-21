class LikesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_blog_post

  def create
    @like = @blog_post.likes.build(user: current_user)
    if @like.save
      redirect_to @blog_post, notice: "You liked this post."
    else
      redirect_to @blog_post, alert: "You have already liked this post."
    end
  end

  private

  def set_blog_post
    @blog_post = BlogPost.find(params[:blog_post_id])
  end
end
