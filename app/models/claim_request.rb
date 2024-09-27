class ClaimRequest < ApplicationRecord
  include AlgoliaSearch

  algoliasearch do
    attribute :type, :name, :status
    # Add other configuration options if needed
  end

  delegate :name, to: :user

  has_paper_trail
  acts_as_paranoid

  paginates_per 10

  belongs_to :user
  belongs_to :claim_request_type

  has_one_attached :document

  validates :document, attached: true, content_type: ['image/png', 'image/jpg', 'image/jpeg'], on: :create
  validate :one_claim_per_year, on: :create
  validate :sufficient_contributions, on: :create

  def type
    claim_request_type.name
  end

    # # Validate on create
    # validate :one_claim_per_year
    # validate :no_unpaid_dues
    # validate :sufficient_contributions

    private
    # # Check if the member already received a claim in the current year
    # def one_claim_per_year
    #   current_year = Time.current.year
    #   # Find claims for the current member within the current year
    #   existing_claim = ClaimRequest.where(user_id: user.id)
    #                               .where('extract(year from created_at) = ?', current_year)
    #                               .exists?

    #   if existing_claim
    #     errors.add(:base, "You have already received a claim this year. You can only request another claim next year.")
    #   end
    # end

    # Check if the member already received a claim in the current year
    def one_claim_per_year
      has_request_within_this_year = ClaimRequest.where(user_id: user_id, status: "Approved", updated_at: 1.year.ago..Time.zone.now).exists?
      if has_request_within_this_year
        errors.add(:base, "You have already received a claim this year. You can only request another claim next year.")
      end
    end

    # # Check if the member has unpaid contribution dues
    # def no_unpaid_dues
    #   if user.unpaid_dues?
    #     errors.add(:base, "You have unpaid contribution dues. Please settle them before making a claim request.")
    #   end
    # end

    # Check if the member has made enough contributions
    def sufficient_contributions
      contributions_within_this_year = Contribution.where(user_id: user_id, updated_at: 1.year.ago.beginning_of_month..Time.zone.now).count
      if contributions_within_this_year < 12
        errors.add(:base, "You need to make #{12 - contributions_within_this_year} more contributions before you can request a claim.")
      end
    end
end
