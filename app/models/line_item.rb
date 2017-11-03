class LineItem < ApplicationRecord
  validates :price, presence: true
end
