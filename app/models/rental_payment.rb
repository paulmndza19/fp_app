class RentalPayment < ApplicationRecord
  include AlgoliaSearch

  algoliasearch do
    attribute :tenant_name, :stall_name, :amount
    # Add other configuration options if needed
  end

  has_paper_trail
  acts_as_paranoid

  belongs_to :stall_rental

  delegate :tenant_name, to: :stall_rental
  delegate :stall_name, to: :stall_rental

  validates :amount, presence: true
  validates :payment_date, presence: true
end
