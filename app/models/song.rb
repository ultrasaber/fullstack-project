class Song < ApplicationRecord
  validates :title, presence: true
  validates :artist, presence: true
  validates :price, presence: true
  validates :preview_link, presence: true

  has_attached_file :album_cover, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/default_album_cover.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

  belongs_to :genre
end
