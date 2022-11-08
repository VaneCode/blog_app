require 'rails_helper'

RSpec.describe User, type: :feature do
  describe 'User show page' do
    before(:each) do
      @photo = 'https://unsplash.com/photos/F_-0BxGuVvo'
      @user = User.create(name: 'Tom', photo: @photo, bio: 'Teacher from Mexico.')
      @post1 = Post.create(author: @user, title: 'Hello 1', text: 'This is my first post')
      @post2 = Post.create(author: @user, title: 'Hello 2', text: 'This is my second post')
      @post3 = Post.create(author: @user, title: 'Hello 3', text: 'This is my third post')
      @post4 = Post.create(author: @user, title: 'Hello 4', text: 'This is my fourth post')
      @id = @user.id
      visit user_path(@id)
    end

    it 'Should display the user\'s profile picture.' do
      expect(page).to have_css("img[src*='#{@photo}']")
    end

    it 'Should display the user\'s username.' do
      expect(page).to have_content(@user.name)
    end

    it 'Should display the number of posts the user has written.' do
      expect(page).to have_content("Number of posts: #{@user.posts_counter}")
    end

    it 'Should displays the user\'s bio' do
      expect(page).to have_content(@user.bio)
    end

    it 'Should display the user\'s first three posts' do
      expect(page).to have_content('This is my second post')
      expect(page).to have_content('This is my third post')
      expect(page).to have_content('This is my fourth post')
      expect(page).not_to have_content('This is my first post')
    end

    it 'Should display a button that lets visitor view all of a user\'s posts' do
      expect(page).to have_content('See all posts')
    end

    it 'When a user\'s post is clicked, it should redirect to that post\'s show page.' do
      click_link(@post2.title)
      expect(page).to have_current_path(user_post_path(@post2.author, @post2))
    end

    it 'When See all posts clicked, it should redirect to the user\'s post\'s index page' do
      click_link('See all posts')
      expect(page).to have_current_path(user_posts_path(@user))
    end
  end
end
