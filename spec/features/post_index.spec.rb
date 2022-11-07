require 'rails_helper'

RSpec.describe Post, type: :feature do
  describe 'index page' do
    before(:each) do
      @photo = 'https://unsplash.com/photos/F_-0BxGuVvo'
      @user1 = User.create(name: 'Tom', photo: @photo, bio: 'Teacher from Mexico.')
      @user2 = User.create(name: 'Lilly', photo: @photo, bio: 'Teacher from Mexico.')
      @post1 = Post.create(author: @user1, title: 'Hello 1', text: 'This is my first post')
      @post2 = Post.create(author: @user1, title: 'Hello 2', text: 'This is my second post')
      @post3 = Post.create(author: @user1, title: 'Hello 3', text: 'This is my third post')
      @post4 = Post.create(author: @user1, title: 'Hello 4', text: 'This is my fourth post')
      Comment.create(post: @post1, author: @user1, text: 'Hi Tom! First comment')
      Comment.create(post: @post1, author: @user2, text: 'Hi Tom! Second comment')
      Comment.create(post: @post1, author: @user2, text: 'Hi Tom! Third comment')
      Comment.create(post: @post1, author: @user2, text: 'Hi Tom! Fourth comment')
      Comment.create(post: @post1, author: @user2, text: 'Hi Tom! Fifth comment')
      Comment.create(post: @post1, author: @user2, text: 'Hi Tom! Sixth comment')
      Like.create(author: @user1, post: @post1)
      Like.create(author: @user2, post: @post1)
      visit user_posts_path(@user1.id)
    end

    it 'It should display the user\'s profile picture.' do
      expect(page).to have_css("img[src*='#{@photo}']")
    end

    it 'It should display the user\'s username.' do
      expect(page).to have_content(@user1.name)
    end

    it 'It should display the number of posts the user has written.' do
      expect(page).to have_content("Number of posts: #{@user1.posts_counter}")
    end

    it 'It should display a post\'s title.' do
      expect(page).to have_content(@post2.title)
    end

    it 'It should display some of the post\'s body.' do
      expect(page).to have_content(@post2.text)
    end

    it 'It should display the first comments on a post.' do
      expect(page).to have_content('Hi Tom! Second comment')
      expect(page).to have_content('Hi Tom! Third comment')
      expect(page).to have_content('Hi Tom! Fourth comment')
      expect(page).to have_content('Hi Tom! Fifth comment')
      expect(page).to have_content('Hi Tom! Sixth comment')
      expect(page).to_not have_content('Hi Tom! First comment')
    end

    it 'It should display how many comments a post has.' do
      expect(page).to have_content("Comments: #{@post1.comments_counter}")
    end

    it 'It should display how many likes a post has.' do
      expect(page).to have_content("Likes: #{@post1.likes_counter}")
    end

    it 'It should display a section for pagination if there are more posts than fit on the view.' do
      expect(page).to have_button('Pagination')
    end

    it 'When a post is clicked, it redirects to that post\'s show page.' do
      click_link(@post1.title)
      expect(page).to have_current_path(user_post_path(@user1, @post1))
    end
  end
end