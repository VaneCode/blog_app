require 'rails_helper'

RSpec.describe Post, type: :model do
  before(:each) do
    @user = User.new(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
    @post = Post.create(author: @user, title: 'Hello', text: 'This is my first post')
  end

  context 'Test user validations' do
    it 'is valid with valid attributes' do
      expect(@user).to be_valid
    end

    it 'title should be present' do
      @post.title = nil
      expect(@post).to_not be_valid
    end

    it 'title should not exceed 250 characters' do
      @post.title = 'a' * 300
      expect(@post).to_not be_valid
    end

    it 'comments_counter should be an integer' do
      @post.comments_counter = 'foo'
      expect(@post).to_not be_valid
    end

    it 'comments_counter should be an greater or equal to 0' do
      @post.comments_counter = 0
      expect(@post).to be_valid
    end

    it 'likes_counter should be an integer' do
      @post.likes_counter = 'foo'
      expect(@post).to_not be_valid
    end

    it 'likes_counter should be an greater or equal to 0' do
      @post.likes_counter = 0
      expect(@post).to be_valid
    end
  end

  context 'Test post methods' do
    it 'After create the post, the author.posts_counter has to be updated' do
      user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
      4.times do
        Post.create do |post|
          post.author = user
          post.title = Faker::Lorem.unique.sentence
          post.text = Faker::Lorem.paragraphs(number: 1)
        end
      end
      expect(user.posts_counter).to eq 4
    end

    it 'recent_comments should return the 5 recent comments for a given post' do
      user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
      first_post = Post.create(author: user, title: 'Hello', text: 'This is my first post')
      10.times do
        Comment.create do |comment|
          comment.post = first_post
          comment.author = user
          comment.text = Faker::Lorem.unique.sentence
        end
      end
      comments = first_post.recent_comments
      expect(comments.size).to eq 5
    end
  end
end
