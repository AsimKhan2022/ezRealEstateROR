class Company < ApplicationRecord
  belongs_to :admin

  has_many_attached :documents
  has_one_attached :avatar

  has_many_attached :license_certificates
  has_many_attached :tax_certificates

  validates :name, presence: true
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP },
                    unless: :skip_email_uniqueness_validation?
  validates :email, uniqueness: true, unless: :skip_email_uniqueness_validation?

  validates :secondary_email, format: { with: URI::MailTo::EMAIL_REGEXP }, allow_blank: true,
                              unless: :skip_email_uniqueness_validation?
  validates :mobile, :fax, :whatsapp, :state, :city, :country, :street_number, :society, :sector, :phase,
            presence: true

  attr_accessor :skip_email_uniqueness_validation

  def update_without_email_validation(params)
    self.skip_email_uniqueness_validation = true
    result = update(params)
    self.skip_email_uniqueness_validation = false
    result
  end

  private

  def skip_email_uniqueness_validation?
    skip_email_uniqueness_validation
  end
end
