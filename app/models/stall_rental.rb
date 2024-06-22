class StallRental < ApplicationRecord
  belongs_to :tenant
  belongs_to :stall

  def display_name
    "#{tenant.name} - #{stall.name}"
  end
end
