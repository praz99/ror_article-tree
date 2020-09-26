class Article < ApplicationRecord
  belongs_to :author, class_name: 'User'
  validates :title, presence: true

  has_one_attached :image
  validates :image, presence: true
  validate :accepted_image

  has_many :votes, dependent: :destroy

  has_many :categorizes
  has_many :categories, through: :categorizes, dependent: :destroy

  scope :popular, -> { order('votes_count DESC NULLS LAST').first }

  def accepted_image
    return unless image.attached?

    errors.add(:image, 'is too large (max 2MB)') unless image.byte_size <= 2.megabyte

    accepted_types = ['image/jpeg', 'image/jpg', 'image/png']
    errors.add(:image, 'must be a JPEG/JPG or PNG') unless accepted_types.include?(image.content_type)
  end
end
