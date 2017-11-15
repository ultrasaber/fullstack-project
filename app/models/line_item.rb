class LineItem < ApplicationRecord
  validates :price, presence: true

  belongs_to :order
  belongs_to :song
end
