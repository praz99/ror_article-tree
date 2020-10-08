class Category < ApplicationRecord
  has_many :categorizes
  has_many :articles, through: :categorizes

  validates :name, presence: true, uniqueness: true, length: { in: 3..30 }
  validates :priority, presence: true, numericality: { only_integer: true }, uniqueness: {
    message: ': Sorry, there is already another category in this priority level.'
  }

  def self.ordered_priority
    all.includes(:articles).order('priority DESC')
  end
end
