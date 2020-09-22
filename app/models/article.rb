class Article < ApplicationRecord
  belongs_to :author, class_name: 'User'
  validates :title, presence: true
end
