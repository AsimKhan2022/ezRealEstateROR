class Witness < ApplicationRecord
  belongs_to :sale

  validates :cnic, presence: true
  validates :phone, presence: true
  validates :name, presence: true
  validates :address, presence: true
  validates :email, presence: true
end
