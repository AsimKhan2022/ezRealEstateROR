class Amenity < ApplicationRecord
  belongs_to :property
  has_one_attached :image_logo
end
