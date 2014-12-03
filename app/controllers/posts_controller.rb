# This controlls the posts
class PostsController < ApplicationController

  def create
    @post = Post.new(post_params)
    redirect_to posts_path
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    redirect_to posts_path
  end

  def show
    @post = Post.find(params[:id])
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :user_id)
  end
end
