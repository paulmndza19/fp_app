class ClaimRequestType < ApplicationRecord
  has_paper_trail
  acts_as_paranoid

  validates :name, uniqueness: true

  # search custom rails model validation
  private

  def has_existing_claim_within_the_year  
    
  end

  def has_unpaid_contribution_dues

  end

  def is_new_and_has_only_made_a_few_contributions
  
  end
end
