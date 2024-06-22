class DailyExpense < ApplicationRecord
  paginates_per 10

  belongs_to :expense_category
end
