require 'rails_helper'

RSpec.describe Vote, type: :model do
  context 'ActiveModelValidations' do
    before(:all) do
      create(:user) do |user|
        @article1 = user.authored_articles.create(attributes_for(:article))
        @article1.image.attach(
          io: File.open(Rails.root.join('spec', 'factories', 'dom-hill-nimElTcTNyY-unsplash.jpg')),
          filename: 'dom-hill-nimElTcTNyY-unsplash.jpg',
          content_type: 'image/jpg'
        )
        @vote1 = user.votes.build(article_id: @article1.id)
      end
    end
  end

  context 'ActiveRecoreAssociations' do
    it 'should have one user' do
      v = described_class.reflect_on_association(:user)
      expect(v.macro).to eq(:belongs_to)
    end

    it 'should have one article' do
      v = described_class.reflect_on_association(:article)
      expect(v.macro).to eq(:belongs_to)
    end
  end
end
