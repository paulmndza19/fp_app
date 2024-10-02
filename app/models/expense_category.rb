class ExpenseCategory < ApplicationRecord
  has_paper_trail
  acts_as_paranoid

  has_many :daily_expenses
  
  validates :name, uniqueness: true
  # validates :name, presence: true
  validates :name, presence: true, format: { with: /\A[a-zA-Z\s]+\z/, message: "only allows letters and spaces" }
end
  