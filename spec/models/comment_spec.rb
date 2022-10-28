require 'rails_helper'

RSpec.describe Comment, type: :model do
  before(:each) do
    @user = User.new(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
    @post = Post.create(author: @user, title: 'Hello', text: 'This is my first post')
    @comment = Comment.create(post: @post, author: @user, text: 'Hi Tom!')
  end

  context 'Test comment methods' do
    it 'After create the comment, the post.comments_counter has to be updated' do
      4.times do
        Comment.create do |comment|
          comment.post = @post
          comment.author = @user
          comment.text = Faker::Lorem.unique.sentence
        end
      end
      expect(@post.comments_counter).to eq 5
    end
  end
end
