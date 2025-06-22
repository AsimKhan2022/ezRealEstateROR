class Article < ApplicationRecord
  belongs_to :admin

  validates :title, :story, :headlines, presence: true
end
