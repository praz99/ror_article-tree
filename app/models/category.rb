class Category < ApplicationRecord
  has_many :categorizes
  has_many :articles, through: :categorizes

  validates :name, presence: true, uniqueness: true, length: { in: 3..30 }
  validates :priority, numericality: { only_integer: true }

  def self.ordered_priority
    all.includes(:articles).order('priority DESC')
  end
end
