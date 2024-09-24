class SalesCategory < ApplicationRecord
  has_paper_trail
  acts_as_paranoid
  
  validates :name, uniqueness: true
end
