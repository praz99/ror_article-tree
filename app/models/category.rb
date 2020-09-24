class Category < ApplicationRecord
  has_many :categorizes
  has_many :articles, through: :categorizes
end
