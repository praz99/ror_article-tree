require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe 'GET users#new' do
    it 'creates a User and redirects to the root page' do
      get :new
      expect(response).to render_template(:new)

      post :create, params: { user: { name: 'test_user' } }

      expect(response).to have_http_status(:found)
      expect(response).to redirect_to('/')
    end
  end

  describe 'GET users#show' do
    before :each do
      @user = create(:user)
      login(@user)
      @params = { id: @user.id }
    end

    it 'returns a successful response' do
      get :show, params: @params
      expect(response).to be_successful
      expect(response.code).to eq '200'
      expect(response).to have_http_status(:ok)
    end
  end
end
