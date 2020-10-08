require 'rails_helper'

RSpec.describe Categorize, type: :model do
  context 'ActiveRecordValidations' do
    it 'belongs to category' do
      c = described_class.reflect_on_association(:category)
      expect(c.macro).to eq(:belongs_to)
    end

    it 'belongs to category' do
      c = described_class.reflect_on_association(:article)
      expect(c.macro).to eq(:belongs_to)
    end
  end
end
