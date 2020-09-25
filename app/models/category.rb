class Category < ApplicationRecord
  has_many :categorizes
  has_many :articles, through: :categorizes

  def self.ordered_priority
    all.includes(:articles).order('priority DESC')
  end
end
