class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :own_post, only: [:edit, :update, :destroy]

  def index
    @posts = Post.all.order("created_at DESC")
  end

  def new
    @post = current_user.posts.build
  end

  def create
    @post = current_user.posts.build(post_params)

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

  def own_post
    unless current_user == @post.user
      flash[:alert] = "Stop being a snoop!"
      redirect_to root_path
    end
  end

end
