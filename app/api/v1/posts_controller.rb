class Api::V1::PostsController < ApplicationController
  def index
    @posts = User.find(params[:user_id]).posts

    if @posts
      render json: { status: 'SUCCESS', message: 'Fetched all the posts successfully', data: @friends }, status: :ok
    else
      render json: @posts.errors, status: :bad_request
    end
  end
end
