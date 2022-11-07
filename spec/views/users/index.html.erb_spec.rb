require 'rails_helper'

RSpec.describe 'users/index.html.erb', type: :view do
  describe 'index page' do
    before(:each) do
        visit users_path
        @users = User.all
    end
  end
end
