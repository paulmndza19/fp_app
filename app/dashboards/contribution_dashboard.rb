require "administrate/base_dashboard"

class ContributionDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  #
  #

  MONTHS = [
    '', 'January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'
  ]

  YEAR_OPTIONS = (2000...(Date.today + 1.year).year).to_a.unshift(' ')

  ATTRIBUTE_TYPES = {
    id: Field::String,
    amount: Field::Number.with_options(
      prefix: "₱",
      decimals: 2,
    ),
    month: Field::Select.with_options(collection: MONTHS),
    user: Field::BelongsTo,
    year: Field::Select.with_options(collection: YEAR_OPTIONS),
    receipt_number: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    # created_by: Field::String,
    # updated_by: Field::String,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = %i[
    user
    receipt_number
    amount
    month
    year
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = %i[
    user
    receipt_number
    amount
    month
    year
    created_at
    updated_at
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = %i[
    user
    amount
    month
    year
    receipt_number
  ].freeze

  # COLLECTION_FILTERS
  # a hash that defines filters that can be used while searching via the search
  # field of the dashboard.
  #
  # For example to add an option to search for open resources by typing "open:"
  # in the search field:
  #
  #   COLLECTION_FILTERS = {
  #     open: ->(resources) { resources.where(open: true) }
  #   }.freeze
  COLLECTION_FILTERS = {
    month: -> (resources, attr) {resources.where(month: attr)},
    year: -> (resources, attr) {resources.where(year: attr)},
    receipt_number: -> (resources, attr) {resources.where(receipt_number: attr)}
  }.freeze

  # Overwrite this method to customize how contributions are displayed
  # across all pages of the admin dashboard.
  #
  def display_resource(contribution)
    "#{contribution.user.name} #{contribution.month} #{contribution.year} Contribution"
  end
end
