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

  # after_commit :update_timestamps, on: :update

  scope :approved, -> { where(status: 'Approved') }

  BASE_BENEFIT = 4608
  ADDITIONAL_RETIREMENT_VALUE = 241.77

  RANGE_TO_VALUE_MAP = {
    (13..24) => 4608,
    (25..36) => 4849.77,
    (37..48) => 5091.54,
    (49..60) => 5333.31,
    (61..72) => 5575.08,
    (73..84) => 5816.85,
    (85..96) => 6058.62,
    (97..108) => 6300.39,
    (109..120) => 6542.16,
    (121..132) => 6783.93,
    (133..144) => 7025.70,
    (145..156) => 7267.47,
    (157..168) => 7509.24,
    (169..180) => 7751.01
  }.freeze

  def type
    claim_request_type.name
  end

  def update_timestamps
    self.approved_at = Time.zone.now if saved_change_to_status && status.downcase == 'approved'
    self.rejected_at = Time.zone.now if saved_change_to_status && status.downcase == 'rejected'

    save!
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
