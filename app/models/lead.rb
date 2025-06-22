class Lead < ApplicationRecord
  belongs_to :assignment
  belongs_to :admin

  has_many :tracks, dependent: :destroy
  accepts_nested_attributes_for :tracks, allow_destroy: true, reject_if: :all_blank
end
