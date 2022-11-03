class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
  end

  def show
    @user = User.find(params[:user_id])
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @author = current_user
    @post = Post.new(params.require(:post).permit(:title, :text))
    @post.author = @author
    if @post.save
      flash[:success] = 'Post saved successfully.'
      redirect_to user_path(@author.id)
    else
      flash.now[:error] = 'Error: Post could not be saved.'
      render :new
    end
  end
end
