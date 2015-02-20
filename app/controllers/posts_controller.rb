class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
      @post = Post.find(params[:id])
        if @post.update(post_params)
          redirect_to @post, notice: "You updated a post!"
        else
          render :edit
      end
  end

  def create
      @post = Post.new(post_params)
        if @post.save
          redirect_to @post, notice: "You created a post!"
        else
          render :new
      end
  end

  def show
    @post = Post.find(params[:id])
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to root_path, notice: "You deleted a post"
  end

  def number_of_likes
    @post = Post.find(params[:id])
    @post.number_of_likes = @post.number_of_likes + 1
    @post.save
    redirect_to root_path
  end

  private

  def post_params
    params.require(:post).permit(:status, :user, :number_of_likes)
  end

end
