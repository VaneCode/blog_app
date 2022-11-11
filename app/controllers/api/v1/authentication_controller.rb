class Api::V1::AuthenticationController < Api::V1::ApplicationController
  # skip_before_action :authenticate_request
  # eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoyLCJleHAiOjE2Njg3OTU0Nzl9.3WzbBxioksVmzVp6JgmH_yHTmiTY849VmU_HV5vvJOM

  def login
    @user = User.find_by_email(params[:email])
    if @user.valid_password? params[:password]
      token = jwt_encode(user_id: @user.id)
      render json: { token: }, status: :ok
    else
      render json: { error: 'Unauthorized' }, status: :unauthorized
    end
  end
end
