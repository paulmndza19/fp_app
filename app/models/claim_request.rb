class ClaimRequest < ApplicationRecord
  belongs_to :user
  belongs_to :claim_request_type

  has_paper_trail
  acts_as_paranoid

  has_one_attached :document
end
