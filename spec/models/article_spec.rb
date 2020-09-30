require 'rails_helper'

RSpec.describe Article, type: :model do
  before(:all) do
    create(:user) do |user|
      @article1 = user.authored_articles.create(attributes_for(:article))
      @article1.image.attach(
        io: File.open(Rails.root.join('spec', 'factories', 'dom-hill-nimElTcTNyY-unsplash.jpg')),
        filename: 'dom-hill-nimElTcTNyY-unsplash.jpg',
        content_type: 'image/jpg'
      )
    end
  end

  context 'ActiveModelValidations' do
    it 'is valid with valid attributes' do
      expect(@article1).to be_valid
    end

    it 'has a valid title' do
      article2 = build(:article, title: nil)
      expect(article2).to_not be_valid
    end

    it 'has a valid image' do
      article2 = build(:article, image: nil)
      expect(article2).to_not be_valid
    end
  end

  context 'ActiveRecordAssociations' do
    it 'should belong to one author' do
      a = described_class.reflect_on_association(:author)
      expect(a.macro).to eq(:belongs_to)
    end

    it 'has many votes' do
      a = described_class.reflect_on_association(:votes)
      expect(a.macro).to eq(:has_many)
    end

    it 'has many categories' do
      a = described_class.reflect_on_association(:categories)
      expect(a.macro).to eq(:has_many)
    end
  end
end
