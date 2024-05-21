class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_blog_post

  def create
    @comment = @blog_post.comments.build(comment_params.merge(user: current_user))
    if @comment.save
      redirect_to @blog_post, notice: "Comment added successfully."
    else
      redirect_to @blog_post, alert: "Comment could not be added."
    end
  end

  private

  def set_blog_post
    @blog_post = BlogPost.find(params[:blog_post_id])
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end
