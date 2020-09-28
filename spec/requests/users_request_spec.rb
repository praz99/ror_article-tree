require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'create new user' do
    it 'creates a User and redirects to the root page' do
      get '/users/new'
      expect(response).to render_template(:new)

      post '/users', params: { user: { name: 'test_user' } }

      expect(response).to have_http_status(:found)
      expect(response).to redirect_to('/')
    end
  end
end
