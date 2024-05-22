class ClaimRequest < ApplicationRecord
  belongs_to :user
  belongs_to :claim_request_type

  has_paper_trail
  acts_as_paranoid

  has_one_attached :document

  validates :document, attached: true, content_type: ['image/png', 'image/jpg', 'image/jpeg']
end
