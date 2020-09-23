class Article < ApplicationRecord
  belongs_to :author, class_name: 'User'
  validates :title, presence: true
  has_one_attached :image
end
