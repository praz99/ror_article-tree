class User < ApplicationRecord
  has_many :authored_articles, foreign_key: 'author_id', class_name: 'Article'
  has_many :votes, dependent: :destroy

  validates :name, presence: true, uniqueness: true, length: { in: 3..30 }
end
