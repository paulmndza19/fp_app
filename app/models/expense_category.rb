class ExpenseCategory < ApplicationRecord
  has_many :daily_expenses
end
