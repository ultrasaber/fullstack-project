require "administrate/base_dashboard"

class OrderDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    address: Field::BelongsTo,
    line_items: Field::HasMany,
    id: Field::Number,
    pst_rate: Field::Number,
    gst_rate: Field::Number,
    hst_rate: Field::Number,
    status: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    grand_total: Field::Number
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :id,
    :address,
    :line_items,
    :grand_total,
    :status
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :address,
    :line_items,
    :id,
    :pst_rate,
    :gst_rate,
    :hst_rate,
    :status,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :address,
    :line_items,
    :pst_rate,
    :gst_rate,
    :hst_rate,
    :status,
  ].freeze

  # Overwrite this method to customize how orders are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(order)
  #   "Order ##{order.id}"
  # end
end
