class Address < ApplicationRecord
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :address, presence: true
  validates :city, presence: true

  belongs_to :province
  belongs_to :user
  has_many :orders

  def display_format
    "#{self.first_name} #{self.last_name} - #{self.address}, #{self.city}, #{self.province.code}"
  end
end
