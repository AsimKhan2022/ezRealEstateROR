class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable

  # attr_accessor :username, :avatar, :telephone, :mobile_phone

  has_one :medium, dependent: :destroy
  accepts_nested_attributes_for :medium

  has_many :companies, dependent: :destroy
  has_many :sellers, dependent: :destroy
  has_many :buyers, dependent: :destroy
  has_many :users, dependent: :destroy
  has_many :properties, dependent: :destroy
  has_many :assignments, dependent: :destroy
  has_many :leads, dependent: :destroy
  has_many :tenants, dependent: :destroy
  has_many :sales, dependent: :destroy
  has_many :articles, dependent: :destroy

  validates :username, presence: true
  validates :avatar, presence: true
  validates :telephone, presence: true
  validates :mobile_phone, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }

  BRONZE_POLICY = { duration: 1.year, cost: 2300, name: 'Bronze' }.freeze
  SILVER_POLICY = { duration: 3.years, cost: 4600, name: 'Silver' }.freeze
  GOLD_POLICY = { duration: 5.years, cost: 6900, name: 'Gold' }.freeze
  POLICIES = [BRONZE_POLICY, SILVER_POLICY, GOLD_POLICY].freeze

  validates :subscription_type, inclusion: { in: POLICIES.map { |policy| policy[:name] } }, allow_nil: true

  def subscription_active?
    subscription_end_date.present? && subscription_end_date > Date.today
  end

  def trial_active?
    trial_start_date.present? && trial_start_date + 7.days > Date.today
  end

  def subscription_expiring_soon?
    subscription_active? && subscription_end_date < Date.today + 15.days
  end

  def start_trial
    update(trial_start_date: Date.today)
  end
end
