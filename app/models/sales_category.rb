class SalesCategory < ApplicationRecord
  validates :name, uniqueness: true
end
