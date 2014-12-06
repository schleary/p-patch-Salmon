# This controlls the posts
class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    puts "ARE WE HERE?"
    @post = Post.new(post_params)
    if @post.save
      NewsMailer.news(@post.id).deliver
      redirect_to posts_path
    else
      render :new
    end
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to posts_path
    else
      render :edit
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :img, :user_id)
  end
end
