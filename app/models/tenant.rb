class Tenant < ApplicationRecord
  validates :first_name, presence: true
  validates :last_name, presence: true

  has_many :stall_rentals

  def name
    "#{first_name} #{last_name}"
  end
end
