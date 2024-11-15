require "administrate/base_dashboard"

class UserDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  #

  ATTRIBUTE_TYPES = {
    member_id_number: Field::String,
    id: Field::String,
    birthday: Field::Date,
    confirmation_sent_at: Field::DateTime,
    confirmation_token: Field::String,
    confirmed_at: Field::DateTime,
    current_sign_in_at: Field::DateTime,
    current_sign_in_ip: Field::String,
    email: Field::String,
    encrypted_password: Field::String,
    failed_attempts: Field::Number,
    first_name: Field::String,
    last_name: Field::String,
    last_sign_in_at: Field::DateTime,
    last_sign_in_ip: Field::String,
    locked_at: Field::DateTime,
    middle_name: Field::String,
    remember_created_at: Field::DateTime,
    reset_password_sent_at: Field::DateTime,
    reset_password_token: Field::String,
    sign_in_count: Field::Number,
    unconfirmed_email: Field::String,
    unlock_token: Field::String,
    role: Field::BelongsTo,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    password: Field::Password,
    address: Field::Text,
    civil_status: Field::Select.with_options(collection: [nil, 'Single', 'Married', 'Widowed', 'Separated']),
    date_employed: Field::Date,
    start_of_membership: Field::Date,
    no_of_children: Field::Number,
    parent_name: Field::String,
    office: Field::Select.with_options(collection: [nil, 'Permanent', 'Casual']),
    full_time: Field::Boolean,
    last_contribution_month: Field::String,
    total_contributions: Field::Number.with_options(
      prefix: "₱",
      decimals: 2,
    )
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = %i[
    member_id_number
    first_name
    last_name
    email
    birthday
    role
    last_contribution_month
    total_contributions
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = %i[
    first_name
    middle_name
    last_name
    email
    birthday
    address
    civil_status
    date_employed
    start_of_membership
    no_of_children
    parent_name
    office
    full_time
    role
    created_at
    updated_at
    last_contribution_month
    total_contributions
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = %i[
    member_id_number
    first_name
    middle_name
    last_name
    email
    birthday
    address
    civil_status
    date_employed
    start_of_membership
    no_of_children
    parent_name
    office
    full_time
    role
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

  def self.search(query)
    User.algolia_search(query).map(&:object_id)
  end

  # Overwrite this method to customize how users are displayed
  # across all pages of the admin dashboard.
  #
  def display_resource(user)
    "#{user.name}"
  end

  def search_attributes
    # Return an array of attributes that should be searchable
    super - [:last_contribution_month]
  end
end
