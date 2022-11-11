require 'swagger_helper'

RSpec.describe 'NomadDev Blog API', type: :request do
  path '/api/v1/users' do
    get 'Retrieves all users' do
      tags 'Users'
      produces 'application/json'
      parameter in: :path, type: :string

      response('200', 'Fetched all the users successfully') do
        schema type: :array,
               items: {
                 type: :object,
                 properties: {
                   user_id: { type: :integer },
                   name: { type: :string },
                   bio: { type: :string },
                   photo: { type: :string },
                   created_at: { type: :string },
                   updated_at: { type: :string }
                 }
               }
        run_test!
      end
    end
  end
end
