class ClaimRequestType < ApplicationRecord
  has_paper_trail
  acts_as_paranoid

  validates :name, uniqueness: true
  # validates :name, presence: true
  validates :name, presence: true, format: { with: /\A[a-zA-Z\s]+\z/, message: "only allows letters and spaces" }
  
  validates :amount, presence: true
end
