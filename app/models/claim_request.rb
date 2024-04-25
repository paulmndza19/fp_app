class ClaimRequest < ApplicationRecord
  belongs_to :user
  belongs_to :claim_request_type
end
