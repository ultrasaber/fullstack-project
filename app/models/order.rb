class Order < ApplicationRecord
  validates :pst_rate, presence: true
  validates :gst_rate, presence: true
  validates :hst_rate, presence: true
  validates :status, presence: true
end
