class Mortgage < ApplicationRecord
  belongs_to :sale

  has_one_attached :receipt
end
