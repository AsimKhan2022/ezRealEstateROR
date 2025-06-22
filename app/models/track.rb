class Track < ApplicationRecord
  belongs_to :lead
  belongs_to :buyer

  enum status: { interested: 0, searching: 1, negotiating: 2, buying: 3, visiting: 4, sold: 5 }

  validates :status, inclusion: { in: statuses.keys }
end
