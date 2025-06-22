class User < ApplicationRecord
  belongs_to :admin
  has_one_attached :avatar

  enum role: { agent: 0, broker: 1, sales: 2, hr: 3, investigator: 4 }

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
