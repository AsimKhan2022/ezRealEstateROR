class Medium < ApplicationRecord
  belongs_to :admin

  has_many_attached :repeater_images
  has_many_attached :banner_images
  has_many_attached :award_images
end
