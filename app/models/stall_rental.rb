class StallRental < ApplicationRecord
  belongs_to :tenant
  belongs_to :stall

  has_many :rental_payments

  def display_name
    "#{tenant.name} - #{stall.name}"
  end
end
