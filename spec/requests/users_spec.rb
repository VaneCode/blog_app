require 'rails_helper'

RSpec.describe 'Users', type: :request do
  before(:each) do
    @photo = 'https://unsplash.com/photos/F_-0BxGuVvo'
    @user = User.create(name: 'Tom', photo: @photo, bio: 'Teacher from Mexico.')
    @id = @user.id
  end

  context 'If response status was correct' do
    describe 'GET /index' do
      it 'returns http success' do
        get '/'
        expect(response).to have_http_status(:success)
      end
    end

    describe 'GET /show' do
      it 'returns http success' do
        get "/users/#{@id}"
        expect(response).to have_http_status(:success)
      end
    end
  end

  context 'If a correct template was rendered' do
    describe 'Render /' do
      it 'should render to index template' do
        get '/'
        expect(response).to render_template(:index)
      end
    end

    describe 'Render /users/show' do
      it 'should render to show template' do
        get "/users/#{@id}"
        expect(response).to render_template(:show)
      end
    end
  end

  context 'If the response body includes correct placeholder text' do
    describe 'index placeholder' do
      it "should include the user's name" do
        get '/'
        expect(response.body).to include("<h2>#{@user.name}</h2>")
      end
    end

    describe 'show placeholder' do
      it 'should include the user\'s bio' do
        get "/users/#{@id}"
        expect(response.body).to include("<p> #{@user.bio}</p>")
      end
    end
  end
end
