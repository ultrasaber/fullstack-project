class Song < ApplicationRecord
  validates :title, presence: true
  validates :artist, presence: true
  validates :price, presence: true
  validates :preview_link, presence: true

  belongs_to :genre
end
