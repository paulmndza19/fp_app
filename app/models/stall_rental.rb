class StallRental < ApplicationRecord
  has_paper_trail
  acts_as_paranoid
  
  belongs_to :tenant
  belongs_to :stall

  has_many :rental_payments

  def display_name
    tenant_name = tenant&.name.presence || "N/A"
    stall_name = stall&.name.presence || "N/A"
    "#{tenant_name} - #{stall_name}"
  end
end
