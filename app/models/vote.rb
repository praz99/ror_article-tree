class Vote < ApplicationRecord
  belongs_to :article, counter_cache: true
  belongs_to :user

  validates :user_id, uniqueness: { scope: :article_id }
end
