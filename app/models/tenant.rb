class Tenant < ApplicationRecord
  belongs_to :lead
  belongs_to :admin
  has_many_attached :legal_documents
  has_many_attached :tenant_documents

  validates :title, :move_in_date, :move_in_time, :move_out_date, :move_out_time, :rent_price, :commission,
            :down_payment, :security_deposit, presence: true

  # Nested attributes for conditions and violations
  has_many :conditions, dependent: :destroy
  accepts_nested_attributes_for :conditions, allow_destroy: true

  has_many :violations, dependent: :destroy
  accepts_nested_attributes_for :violations, allow_destroy: true
end
