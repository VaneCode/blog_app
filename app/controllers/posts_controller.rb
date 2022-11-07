class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts.includes([:author]).order(created_at: :desc)
  end

  def show
    @user = User.find(params[:user_id])
    @post = Post.find(params[:id])
    @comments = @post.comments.includes([:author])
  end

  def new
    @post = Post.new
  end

  def create
    @author = current_user
    @post = Post.new(post_params)
    @post.author = @author
    if @post.save
      flash[:notice] = 'Post saved successfully.'
      redirect_to user_path(@author.id)
    else
      flash.now[:error] = 'Error: Post could not be saved.'
      render :new
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
