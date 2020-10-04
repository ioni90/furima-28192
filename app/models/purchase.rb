class Purchase < ApplicationRecord
  belongs_to :user
  belongs_to :item
  has_one :ship_to_location
end
