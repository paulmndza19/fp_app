class DailySale < ApplicationRecord
  has_paper_trail
  acts_as_paranoid
  
  paginates_per 10
  default_scope { order(sales_date: :desc) }

  belongs_to :sales_category

  validates :sales_category, uniqueness: {
    scope: :sales_date, message: 'for this date has already been uploaded'
  }

  validates :amount, presence: true
  validates :sales_date, presence: true
end
