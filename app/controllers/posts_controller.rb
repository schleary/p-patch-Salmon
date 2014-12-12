# This controls the posts
class PostsController < ApplicationController

  def index
    @posts = Post.all
    @posts.to_a.reverse!
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      @users = User.all
      @users = @users.map {|user| user if user.confirmed? }
      @users.each do |user|
        unless !user
          Resque.enqueue(EmailNewsJob, @post.id, user.id)
        end
      end
      redirect_to posts_path
    else
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
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

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :img, :author)
  end
end
