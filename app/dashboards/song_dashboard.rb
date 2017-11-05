require "administrate/base_dashboard"

class SongDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    genre: Field::BelongsTo,
    id: Field::Number,
    title: Field::String,
    artist: Field::String,
    price: Field::Number,
    preview_link: Field::String,
    on_sale: Field::Boolean,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    description: Field::Text,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :genre,
    :id,
    :title,
    :artist,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :genre,
    :id,
    :title,
    :artist,
    :price,
    :preview_link,
    :on_sale,
    :created_at,
    :updated_at,
    :description,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :genre,
    :title,
    :artist,
    :price,
    :preview_link,
    :on_sale,
    :description,
  ].freeze

  # Overwrite this method to customize how songs are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(song)
  #   "Song ##{song.id}"
  # end
end
