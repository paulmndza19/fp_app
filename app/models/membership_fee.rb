class MembershipFee < ApplicationRecord
  include AlgoliaSearch

  algoliasearch do
    attribute :name
    # Add other configuration options if needed
  end

  has_paper_trail
  acts_as_paranoid

  belongs_to :user

  delegate :name, to: :user
  validates :amount, presence: true
end
