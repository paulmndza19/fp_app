class ClaimRequestType < ApplicationRecord
  has_paper_trail
  acts_as_paranoid

  validates :name, uniqueness: true

  # MALI (DAPAT NASA claim_request.rb siya pero comment ko na din)

  # search custom rails model validation
  # private

  # def has_existing_claim_within_the_year
  #   @member.claims.where(created_at: Time.now.beginning_of_year..Time.now.end_of_year).none?
  # end 

  # def has_unpaid_contribution_dues
  #   @member.contributions.where(paid: false).none?
  # end

  # def is_new_and_has_only_made_a_few_contributions
  #   @member.contributions.count > MINIMUM_CONTRIBUTIONS_REQUIRED
  # end
  
end
