require 'rails_helper'

RSpec.describe Post, type: :feature do
  describe 'Post show page' do
    before(:each) do
      @photo = 'https://unsplash.com/photos/F_-0BxGuVvo'
      @user1 = User.create(name: 'Tom', photo: @photo, bio: 'Teacher from Mexico.')
      @user2 = User.create(name: 'Lilly', photo: @photo, bio: 'Teacher from Mexico.')
      @post = Post.create(author: @user1, title: 'Hello 1', text: 'This is my first post')
      @comment1 = Comment.create(post: @post, author: @user1, text: 'Hi Tom! First comment')
      @comment2 = Comment.create(post: @post, author: @user2, text: 'Hi Tom! Second comment')
      @comment3 = Comment.create(post: @post, author: @user2, text: 'Hi Tom! Third comment')
      Like.create(author: @user1, post: @post)
      Like.create(author: @user2, post: @post)
      visit user_post_path(@user1, @post)
    end

    it 'It should display the post\'s title.' do
      expect(page).to have_content(@post.title)
    end

    it 'It should display who wrote the post.' do
      expect(page).to have_content("#{@post.title} by #{@post.author.name}")
    end

    it 'It should display how many comments the post has.' do
      expect(page).to have_content("Comments: #{@post.comments_counter}")
    end

    it 'It should display how many likes the post has.' do
      expect(page).to have_content("Likes: #{@post.likes_counter}")
    end

    it 'It should display the post body' do
      expect(page).to have_content(@post.text)
    end

    it 'It should display the username of each commentor.' do
      expect(page).to have_content(@comment1.author.name)
      expect(page).to have_content(@comment2.author.name)
      expect(page).to have_content(@comment3.author.name)
    end

    it 'It should display the comment each commentor left.' do
      expect(page).to have_content(@comment1.text)
      expect(page).to have_content(@comment2.text)
      expect(page).to have_content(@comment3.text)
    end
  end
end
