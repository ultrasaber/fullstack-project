require "administrate/base_dashboard"

class UserDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    orders: Field::HasMany,
    id: Field::Number,
    email: Field::String,
    password_digest: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    first_name: Field::String,
    last_name: Field::String,
    address: Field::String,
    city: Field::String,
    is_admin: Field::Boolean,
    province_id: Field::Number,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :orders,
    :id,
    :email,
    :password_digest,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :orders,
    :id,
    :email,
    :password_digest,
    :created_at,
    :updated_at,
    :first_name,
    :last_name,
    :address,
    :city,
    :is_admin,
    :province_id,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :orders,
    :email,
    :password_digest,
    :first_name,
    :last_name,
    :address,
    :city,
    :is_admin,
    :province_id,
  ].freeze

  # Overwrite this method to customize how users are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(user)
  #   "User ##{user.id}"
  # end
end
