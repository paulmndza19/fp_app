class DailySale < ApplicationRecord
  include AlgoliaSearch

  algoliasearch do
    attribute :name
    # Add other configuration options if needed
  end

  belongs_to :sales_category

  delegate :name, to: :sales_category

  has_paper_trail
  acts_as_paranoid

  paginates_per 10
  default_scope { order(sales_date: :desc) }

  validates :sales_category, uniqueness: {
    scope: :sales_date, message: 'for this date has already been uploaded'
  }

  validates :amount, presence: true
  validates :sales_date, presence: true
end
