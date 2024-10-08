class StallRental < ApplicationRecord
  include AlgoliaSearch

  algoliasearch do
    attribute :stall_name, :tenant_name
    # Add other configuration options if needed
  end

  has_paper_trail
  acts_as_paranoid

  belongs_to :tenant
  belongs_to :stall

  delegate :name, to: :tenant, prefix: true
  delegate :name, to: :stall, prefix: true

  has_many :rental_payments

  def display_name
    tenant_name = tenant&.name.presence || "N/A"
    stall_name = stall&.name.presence || "N/A"
    "#{tenant_name} - #{stall_name}"
  end
end
