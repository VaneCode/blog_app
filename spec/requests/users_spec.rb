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

  context "If a correct template was rendered" do
    it 'should render to index template' do
      get '/'
      expect(response).to render_template(:index)
    end

    it 'should render to show template' do
      get '/users/show'
      expect(response).to render_template(:show)
    end
  end
end
