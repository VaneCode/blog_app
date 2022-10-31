require 'rails_helper'

RSpec.describe 'Users', type: :request do
  context 'If response status was correct' do
    describe 'GET /index' do
      it 'returns http success' do
        get '/users/index'
        expect(response).to have_http_status(:success)
      end
    end

    describe 'GET /show' do
      it 'returns http success' do
        get '/users/show'
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
        get '/users/show'
        expect(response).to render_template(:show)
      end
    end
  end

  context 'If the response body includes correct placeholder text' do
    describe 'index placeholder' do
      it 'should include the text Here is a list of all users' do
        get '/'
        expect(response.body).to include('Here is a list of all users')
      end
    end

    describe 'show placeholder' do
      it 'should include the text Here is a single user' do
        get '/users/show'
        expect(response.body).to include('Here is a single user')
      end
    end
  end
end
