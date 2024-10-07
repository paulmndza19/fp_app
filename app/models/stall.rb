class Stall < ApplicationRecord
    has_paper_trail
    acts_as_paranoid

    validates :name, uniqueness: true
    validates :name, presence: true
end
