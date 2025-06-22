class Assignment < ApplicationRecord
  belongs_to :admin
  belongs_to :company
  belongs_to :user
  belongs_to :property
  belongs_to :seller

  has_many :leads, dependent: :destroy
end
