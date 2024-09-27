class DailyExpense < ApplicationRecord
  include AlgoliaSearch

  algoliasearch do
    attribute :name
    # Add other configuration options if needed
  end

  belongs_to :expense_category

  delegate :name, to: :expense_category

  has_paper_trail
  acts_as_paranoid

  paginates_per 10
end
