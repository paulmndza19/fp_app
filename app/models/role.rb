class Role < ApplicationRecord
  has_paper_trail
  acts_as_paranoid
end
