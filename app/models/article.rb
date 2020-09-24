class Article < ApplicationRecord
  belongs_to :author, class_name: 'User'
  validates :title, presence: true

  has_one_attached :image
  validate :accepted_image

  has_many :votes, dependent: :destroy

  def accepted_image
    return unless image.attached?

    unless image.byte_size <= 2.megabyte
      errors.add(:image, 'is too large (max 2MB)')
    end

    accepted_types = ['image/jpeg', 'image/jpg', 'image/png']
    unless accepted_types.include?(image.content_type)
      errors.add(:image, 'must be a JPEG/JPG or PNG')
    end
  end
end
