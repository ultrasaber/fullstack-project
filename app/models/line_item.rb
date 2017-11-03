class LineItem < ApplicationRecord
  validates :price, presence: true

  belongs_to :order
end
