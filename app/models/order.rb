class Order < ApplicationRecord
  validates :pst_rate, presence: true
  validates :gst_rate, presence: true
  validates :hst_rate, presence: true
  validates :status, presence: true

  belongs_to :address
  has_many :line_items

  def subtotal
    subtotal = 0

    self.line_items.each do |line_item|
      subtotal += line_item.price
    end

    subtotal
  end

  def gst
    (self.subtotal * (self.gst_rate / 100.0)).round.to_i
  end

  def pst
    (self.subtotal * (self.pst_rate / 100.0)).round.to_i
  end

  def hst
    (self.subtotal * (self.hst_rate / 100.0)).round.to_i
  end

  def grand_total
    self.subtotal + self.gst + self.pst + self.hst
  end
end
