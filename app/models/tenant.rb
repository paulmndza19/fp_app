class Tenant < ApplicationRecord
  has_paper_trail
  acts_as_paranoid

  validates :first_name, presence: true
  validates :last_name, presence: true

  has_many :stall_rentals
  has_many :rental_payments, through: :stall_rentals

  def name
    "#{first_name} #{last_name}"
  end
end
