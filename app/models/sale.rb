class Sale < ApplicationRecord
  belongs_to :admin
  belongs_to :lead
  belongs_to :buyer
  belongs_to :seller

  has_many :witnesses, dependent: :destroy
  has_many :mortgages, dependent: :destroy

  has_one_attached :transfer_paper
  has_one_attached :sales_deed
  has_one_attached :clearance_certificate

  accepts_nested_attributes_for :witnesses, allow_destroy: true
  accepts_nested_attributes_for :mortgages, allow_destroy: true

  validates :sale_date, presence: true
  validates :sale_time, presence: true
  validates :sale_price, presence: true, numericality: { greater_than: 0 }
  validates :commission, presence: true, numericality: { greater_than: 0 }
  validates :agent_commission, presence: true, numericality: true
  validates :sales_agent_commission, presence: true, numericality: true
end
