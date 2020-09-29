require 'rails_helper'

RSpec.describe Category, type: :model do
  before(:all) do
    @category1 = create(:category)
  end

  describe 'ActiveModelValidations' do
    it 'is valid with valid attributes' do
      expect(@category1).to be_valid
    end

    it 'has a valid name' do
      category1 = build(:category, name: nil)
      expect(category1).to_not be_valid
    end

    it 'should have name between 3 and 30 characters' do
      category1 = build(:category, name: 'xyz', priority: 13)
      expect(category1).to be_valid
    end

    it 'should not accept name of over 30 characters' do
      category1 = build(:category, name: 'this is a really large name given')
      expect(category1).to_not be_valid
    end

    it 'should not accept name of less than 3 characters' do
      category1 = build(:category, name: 'ab')
      expect(category1).to_not be_valid
    end

    it 'should have a unique name' do
      category1 = build(:category, name: 'literature')
      expect(category1).to_not be_valid
    end

    it 'should have a priority' do
      category1 = build(:category, name: 'history', priority: nil)
      expect(category1).to_not be_valid
    end

    it 'priority should be only integer number' do
      category1 = build(:category, name: 'politics', priority: 1)
      expect(category1).to be_valid
    end

    it 'should have a unique priority' do
      category1 = build(:category, name: 'science', priority: 12)
      expect(category1).to_not be_valid
    end
  end

  describe 'ActiveRecordAssociations' do
    it 'has many articles' do
      a = described_class.reflect_on_association(:articles)
      expect(a.macro).to eq(:has_many)
    end
  end
end
