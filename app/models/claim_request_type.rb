class ClaimRequestType < ApplicationRecord
  validates :name, uniqueness: true
end
