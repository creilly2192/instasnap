class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.all.order("created_at DESC")
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    if @post.save
      flash[:success] = "Post was successfully uploaded!"
      redirect_to posts_path
    else
      flash[:alert] = "Halt, you fiend! You need an image to post here!"
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    @post.update(post_params)

    if @post.save
      flash[:success] = "Post was successfully updated!"
      redirect_to post_path(@post)
    else
      flash[:alert] = "Post was NOT updated!"
      render 'edit'
    end
  end

  def destroy
    @post.destroy

    if @post = @post.destroy
      redirect_to posts_path
      flash[:alert] = "Post was deleted!"
    else
      render 'show'
      flash[:alert] = "Post was NOT deleted!"
    end
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:image, :caption)
  end

end
