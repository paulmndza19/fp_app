class StallRental < ApplicationRecord
  has_paper_trail
  acts_as_paranoid
  
  belongs_to :tenant
  belongs_to :stall

  has_many :rental_payments

  def display_name
    "#{tenant.name} - #{stall.name}"
  end
end
