class DailyExpense < ApplicationRecord
  has_paper_trail
  acts_as_paranoid
  
  paginates_per 10

  belongs_to :expense_category
end
