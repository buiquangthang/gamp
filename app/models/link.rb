class Link < ApplicationRecord
  validates_uniqueness_of :origin, scope: [:destination]
end
