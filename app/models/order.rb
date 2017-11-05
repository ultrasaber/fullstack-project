class Order < ApplicationRecord
  validates :pst_rate, presence: true
  validates :gst_rate, presence: true
  validates :hst_rate, presence: true
  validates :status, presence: true

  belongs_to :address
  has_many :line_items
end
