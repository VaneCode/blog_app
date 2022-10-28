require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.') }

  before { subject.save }

  context 'Test user validations' do
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end

    it 'name should be present' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'posts_counter should be an integer' do
      subject.posts_counter = 'foo'
      expect(subject).to_not be_valid
    end

    it 'posts_counter should be an greater or equal to 0' do
      subject.posts_counter = 0
      expect(subject).to be_valid
    end
  end

  context 'Test user methods' do
    it 'After create the post, the posts_counter has to update' do
      user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
      first_post = Post.create(author: user, title: 'Hello', text: 'This is my first post')
      expect(user.posts_counter).to eq 1
    end
  end
end
