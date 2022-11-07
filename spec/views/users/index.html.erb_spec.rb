require 'rails_helper'

RSpec.describe 'users/index.html.erb', type: :view do
  describe 'index page' do
    before(:each) do
        visit users_path
        @users = User.all
    end

    it 'should see the username of all other users.' do
      @users.each do |user|
          expect(page).to have_content(user.name)
      end
    end

    it 'i can see the profile picture for each usere'
      @users.each do |user|
          expect(page).to have_content(user.photo)
      end
  end

  it 'i can see the number of posts each user has written'
      @users.each do |user|
        expect(page).to have_content(user.post)
    end
  end
  end
end
