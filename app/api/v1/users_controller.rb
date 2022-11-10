class Api::V1::UsersController < Api::V1::ApplicationController
  def index
    users = User.all.order('id ASC')
    if users
      render json: { status: 'SUCCESS', message: 'Fetched all the users successfully', data: users }, status: :ok
    else
      render json: users.errors, status: :bad_request
    end
  end

  def show
    user = User.find(params[:id])
    if user
      render json: { data: user }, state: :ok
    else
      render json: { message: 'User could not be found' }, status: :bad_request
    end
  end
end
