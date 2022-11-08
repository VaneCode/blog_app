require 'rails_helper'

RSpec.describe User, type: :feature do
  describe 'User index page' do
    before(:each) do
      @photo1 = 'https://unsplash.com/photos/F_-0BxGuVvo'
      @photo2 = 'https://unsplash.com/photos/F_-2wcsIWcs'
      @user1 = User.create(name: 'Tom', photo: @photo1, bio: 'Teacher from Mexico.')
      @user2 = User.create(name: 'Lilly', photo: @photo2, bio: 'Teacher from Polland.')
      @post1 = Post.create(author: @first_user, title: 'Hello', text: 'This is my first post')
      @post2 = Post.create(author: @first_user, title: 'Hello', text: 'This is my second post')
      @post3 = Post.create(author: @first_user, title: 'Hello', text: 'This is my third post')
      @post4 = Post.create(author: @first_user, title: 'Hello', text: 'This is my fourth post')
      visit root_path
    end

    it 'Should display username of all other users.' do
      expect(page).to have_content(@user1.name)
      expect(page).to have_content(@user2.name)
    end

    it 'Should display the user\'s profile picture.' do
      expect(page).to have_css("img[src*='#{@photo1}']")
      expect(page).to have_css("img[src*='#{@photo2}']")
    end

    it 'Should display the number of posts the user has written.' do
      expect(page).to have_content("Number of posts: #{@user1.posts_counter}")
      expect(page).to have_content("Number of posts: #{@user2.posts_counter}")
    end

    it 'When a user is clicked, it should redirect to that user\'s show page.' do
      click_link('Lilly')
      expect(current_path).to eq(user_path(@user2.id))
    end
  end
end
