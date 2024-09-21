require "administrate/base_dashboard"

class ClaimRequestDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    id: Field::String,
    remarks: Field::String,
    claim_request_type: Field::BelongsTo,
    deleted_at: Field::DateTime,
    status: Field::Select.with_options(collection: %w[Pending Approved Rejected]),
    user: Field::BelongsTo,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    document: Field::ActiveStorage.with_options(index_display_preview: true),
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = %i[
    user
    claim_request_type
    status
    remarks
    document
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = %i[
    id
    user
    claim_request_type
    status
    remarks
    created_at
    updated_at
    document
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = %i[
    user
    claim_request_type
    status
    remarks
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
  COLLECTION_FILTERS = {}.freeze

  # Overwrite this method to customize how claim requests are displayed
  # across all pages of the admin dashboard.
  #
  def display_resource(claim_request)
    "#{claim_request.claim_request_type.name} ClaimRequest by #{claim_request.user.name}"
  end
end
