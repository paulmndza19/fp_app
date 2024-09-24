class ExpenseCategory < ApplicationRecord
  has_paper_trail
  acts_as_paranoid

  has_many :daily_expenses
end
  