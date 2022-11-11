require 'swagger_helper'

RSpec.describe 'api/v1/posts', type: :request do
  path '/api/v1/posts' do
    get 'Retrieves all posts for a given user' do
      tags 'Posts'
      produces 'application/json'
      parameter name: 'user_id', in: :path, type: :string

      response('200', 'posts retrieved') do
        schema type: :array,
               items: {
                 type: :object,
                 properties: {
                   comments: { type: :array },
                   likes: { type: :array },
                   author_id: { type: :integer },
                   post_id: { type: :integer },
                   post_title: { type: :string },
                   post_text: { type: :string },
                   created_at: { type: :string },
                   updated_at: { type: :string }
                 }
               }
        let!(:user) { create(:user) }
        let(:auth_token) { user.authentication_token }
        run_test!
      end
    end
  end
end
