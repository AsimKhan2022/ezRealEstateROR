class Buyer < ApplicationRecord
  belongs_to :admin

  validates :home_address_street_number, :business_address_street_number, numericality: { only_integer: true },
                                                                          allow_nil: true
  validates :home_address_city, :business_address_city, :home_address_state, :business_address_state,
            :home_address_country, :business_address_country, :home_address_society, :business_address_society, :home_address_phase, :business_address_phase, presence: true, allow_blank: true
  validates :home_address_sector, :business_address_sector, presence: true, allow_blank: true
  validates :whatsapp, presence: true, allow_blank: true
end
