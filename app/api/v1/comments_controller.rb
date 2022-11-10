class Api::V1::CommentsController < ApplicationController
  def index
    @comments = Post.find(params[:post_id]).comments
    if @comments
      render json: { status: 'SUCCESS', message: "Fetched all post's comments.", data: @comments }, status: :ok
    else
      render json: @comments.errors, status: :bad_request
    end
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = Comment.new(comment_params)
    @comment.author = current_user
    @comment.post = @post
    if @comment.save
      render json: { status: 'SUCCESS', message: 'Comment was created successfully!', data: comment },
             status: :created
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
