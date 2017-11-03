class Province < ApplicationRecord
  validates :name, presence: true
  validates :code, presence: true
  validates :pst_rate, presence: true
  validates :gst_rate, presence: true
  validates :hst_rate, presence: true

  has_many :users
end
