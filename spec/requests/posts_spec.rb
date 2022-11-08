require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  before(:each) do
    @photo = 'https://unsplash.com/photos/F_-0BxGuVvo'
    @user = User.create(name: 'Tom', photo: @photo, bio: 'Teacher from Mexico.')
    @post = Post.create(title: 'My first post', author: @user, text: 'Text of my first post')
    @id = @user.id
  end

  context 'If response status was correct' do
    describe 'GET /index' do
      it 'returns http success' do
        get "/users/#{@id}/posts/"
        expect(response).to have_http_status(:success)
      end
    end

    describe 'GET /show' do
      it 'returns http success' do
        get "/users/#{@id}/posts/#{@post.id}"
        expect(response).to have_http_status(:success)
      end
    end
  end

  context 'If a correct template was rendered' do
    describe 'Render /users/:user_id/posts' do
      it 'should render to index template' do
        get "/users/#{@id}/posts"
        expect(response).to render_template(:index)
      end
    end

    describe 'Render /users/:user_id/posts/:id' do
      it 'should render to show template' do
        get "/users/#{@id}/posts/#{@post.id}"
        expect(response).to render_template(:show)
      end
    end
  end

  context 'If the response body includes correct placeholder text' do
    describe 'index placeholder' do
      it 'Should include posts\' author name' do
        get "/users/#{@id}/posts"
        expect(response.body).to include("<h2>#{@post.author.name}</h2>")
      end
    end

    describe 'show placeholder' do
      it 'should include the post\'s text' do
        get "/users/#{@id}/posts/#{@post.id}"
        expect(response.body).to include("<p>#{@post.text}</p>")
      end
    end
  end
end
