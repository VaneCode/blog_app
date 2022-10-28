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
    it 'recent_posts should return the 3 recent post for a given user' do
      user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
      10.times do
        Post.create do |post|
          post.author = user
          post.title = Faker::Lorem.unique.sentence
          post.text = Faker::Lorem.paragraphs(number: 1)
        end
      end
      post = user.recent_posts
      expect(post.size).to eq 3
    end
  end
end
