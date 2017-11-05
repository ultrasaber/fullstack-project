class Address < ApplicationRecord
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :address, presence: true
  validates :city, presence: true

  belongs_to :province
  belongs_to :user
  has_many :orders
end
