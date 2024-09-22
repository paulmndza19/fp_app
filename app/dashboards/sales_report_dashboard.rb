# app/dashboards/sales_dashboard.rb
require 'administrate/base_dashboard'

class SalesReportDashboard < Administrate::BaseDashboard
  ATTRIBUTE_TYPES = {
    date: Field::DateTime,
    total_sales: Field::Number.with_options(prefix: "$", decimals: 2)
  }.freeze

  COLLECTION_ATTRIBUTES = [
    :date,
    :total_sales,
  ].freeze

  SHOW_PAGE_ATTRIBUTES = [
    :date,
    :total_sales,
  ].freeze

  FORM_ATTRIBUTES = [
    # no form attributes as we're not creating sales manually
  ].freeze

  COLLECTION_FILTERS = {}.freeze
end
