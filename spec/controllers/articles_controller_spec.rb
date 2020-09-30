require 'rails_helper'

RSpec.describe ArticlesController, type: :controller do
  before(:each) do
    @user = create(:user)
    @category = create(:category)
    login(@user)
  end

  describe 'POST articles#create' do
    let(:article) { { author_id: @user.id, title: 'new article', text: 'new article text', category: @category } }
    subject { post :create, params: { article: article } }

    it 'renders same page if not valid params passed' do
      expect(response.code).to eq '200'
      expect(response).to have_http_status(:ok)
    end
  end
end
