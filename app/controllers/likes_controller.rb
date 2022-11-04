class LikesController < ApplicationController
  def create
    @p_author = User.find(params[:user_id])
    @post = Post.find(params[:post_id])
    @like = Like.new
    @like.author = current_user
    @like.post = @post

    if @like.save
      redirect_to user_post_path(@p_author, @post)
      # redirect_back_or_to(fallback_location, allow_other_host: true)
      # render template: "shared_partials/counters_post", locals: {post: @post}
    else
      flash.now[:error] = 'Error: Like could not be saved.'
      render :new
    end
  end
end
