class ListNode < ApplicationRecord
  belongs_to :bus_route
  serialize :list, Array
end
