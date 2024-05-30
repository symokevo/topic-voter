class BlogPostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_blog_post, only: [:show, :edit, :update, :destroy]
  before_action :authorize_company_head!, only: [:new, :create, :edit, :update, :destroy]

  def index
    @categories = Category.includes(:blog_posts).all
    @blog_posts = BlogPost.all
  end

  def show
  end

  def new
    @blog_post = BlogPost.new
  end

  def create
    @blog_post = current_user.blog_posts.build(blog_post_params)
    if @blog_post.save
      redirect_to @blog_post, notice: "Blog post was successfully created."
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @blog_post.update(blog_post_params)
      redirect_to @blog_post, notice: "Blog post was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @blog_post.destroy
    redirect_to blog_posts_url, notice: "Blog post was successfully destroyed."
  end

  private

  def set_blog_post
    @blog_post = BlogPost.find(params[:id])
  end

  def blog_post_params
    params.require(:blog_post).permit(:title, :content, :category_id)
  end

  def authorize_company_head!
    unless current_user.role.in?(["CTO", "CEO", "Team Lead"])
      redirect_to root_path, alert: "You are not authorized to perform this action."
    end
  end
end
