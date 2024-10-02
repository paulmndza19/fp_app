class RentalPayment < ApplicationRecord
  has_paper_trail
  acts_as_paranoid

  belongs_to :stall_rental
  validates :amount, presence: true
end
