require "administrate/base_dashboard"

class AddressDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    province: Field::BelongsTo,
    user: Field::BelongsTo,
    orders: Field::HasMany,
    id: Field::Number,
    first_name: Field::String,
    last_name: Field::String,
    address: Field::String,
    city: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    display_format: Field::String
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :id,
    :display_format,
    :user,
    :orders,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :province,
    :user,
    :orders,
    :id,
    :first_name,
    :last_name,
    :address,
    :city,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :province,
    :user,
    :orders,
    :first_name,
    :last_name,
    :address,
    :city,
  ].freeze

  # Overwrite this method to customize how addresses are displayed
  # across all pages of the admin dashboard.
  #
  def display_resource(address)
    "##{address.id} - #{address.display_format}"
  end
end
