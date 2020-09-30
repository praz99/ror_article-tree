require 'rails_helper'

RSpec.describe User, type: :model do
  context 'ActiveModelValidations' do
    before(:all) do
      @user1 = create(:user)
    end

    it 'is valid with valid attributes' do
      expect(@user1).to be_valid
    end

    it 'has a valid name' do
      user2 = build(:user)
      expect(user2).to_not be_valid
    end

    it 'should have name between 3 and 30 characters' do
      user1 = build(:user, name: 'xyz')
      expect(user1).to be_valid
    end

    it 'should not accept name of over 30 characters' do
      user1 = build(:user, name: 'this is a really large name given')
      expect(user1).to_not be_valid
    end

    it 'should not accept name of less than 3 characters' do
      user1 = build(:user, name: 'ab')
      expect(user1).to_not be_valid
    end

    it 'should have a unique name' do
      user1 = build(:user, name: 'alice')
      expect(user1).to_not be_valid
    end
  end

  context 'ActiveRecordAssociations' do
    it 'should have many authored_articles' do
      a = described_class.reflect_on_association(:authored_articles)
      expect(a.macro).to eq(:has_many)
    end

    it 'should have many votes' do
      v = described_class.reflect_on_association(:votes)
      expect(v.macro).to eq(:has_many)
    end
  end
end
