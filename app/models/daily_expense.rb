class DailyExpense < ApplicationRecord
  include AlgoliaSearch

  algoliasearch do
    attribute :name
    # Add other configuration options if needed
  end

  has_one_attached :document

  validates :document, attached: true, content_type: ['image/png', 'image/jpg', 'image/jpeg']
  
  belongs_to :expense_category

  delegate :name, to: :expense_category

  has_paper_trail
  acts_as_paranoid

  paginates_per 10

  validates :amount, presence: true
  validates :expense_date, presence: true
end
