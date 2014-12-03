class PostsController < ApplicationController

  def create
    @post = Post.new(params[:post])
    redirect_to posts_path
  end
end
