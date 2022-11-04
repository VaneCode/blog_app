class CommentsController < ApplicationController
  def create
    @p_author = User.find(params[:user_id])
    @post = Post.find(params[:post_id])
    @comment = Comment.new(params.require(:comment).permit(:text))
    @comment.author = current_user
    @comment.post = @post

    if @comment.save
      flash[:success] = 'Comment saved successfully.'
      redirect_to user_post_path(@p_author, @post)
    else
      flash.now[:error] = 'Error: Comment could not be saved.'
      render :new
    end
  end
end
