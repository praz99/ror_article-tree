class Categorize < ApplicationRecord
  belongs_to :category
  belongs_to :article
end
