require "administrate/base_dashboard"

class ProvinceDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    addresses: Field::HasMany,
    id: Field::Number,
    pst_rate: Field::Number,
    gst_rate: Field::Number,
    hst_rate: Field::Number,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    name: Field::String,
    code: Field::String,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :addresses,
    :id,
    :pst_rate,
    :gst_rate,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :addresses,
    :id,
    :pst_rate,
    :gst_rate,
    :hst_rate,
    :created_at,
    :updated_at,
    :name,
    :code,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :addresses,
    :pst_rate,
    :gst_rate,
    :hst_rate,
    :name,
    :code,
  ].freeze

  # Overwrite this method to customize how provinces are displayed
  # across all pages of the admin dashboard.
  #
  def display_resource(province)
    "##{province.id} - #{province.name}"
  end
end
