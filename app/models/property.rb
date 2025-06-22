class Property < ApplicationRecord
  belongs_to :admin

  has_many :amenities, dependent: :destroy, inverse_of: :property
  accepts_nested_attributes_for :amenities, allow_destroy: true, reject_if: :all_blank

  has_many_attached :documents
  has_many_attached :images

  has_one_attached :main_image
  validate :main_image_attached

  attribute :is_verified, :boolean, default: false

  # attr_accessor :latitude, :longitude
  validates :latitude, :longitude, presence: true
  validates :asking_price, numericality: { greater_than_or_equal_to: 0 }, allow_nil: true
  validates :investigator_id, allow_nil: true, numericality: { only_integer: true }

  validates :footage_unit, inclusion: { in: %w[acres kanals sq_ft sq_m marla sq_yd hectares], allow_blank: true }
  validates :currency, inclusion: { in: %w[usd pak_rs saudi_riyal], allow_blank: true }

  def main_image_attached
    # If main_image is missing and it's a new record or it's removed on an existing record
    return unless main_image.nil? && (new_record? || (removed_main_image? && main_image.nil?))

    errors.add(:main_image, "can't be blank")
  end

  private

  # Checks if the main image is being removed
  def removed_main_image?
    # You can set a flag based on the remove_main_image parameter passed in the controller
    @removed_main_image ||= false
  end

  # You can set this flag from the controller
  def mark_main_image_for_removal
    @remove_main_image = true
  end
end
