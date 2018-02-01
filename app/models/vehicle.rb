class Vehicle < ApplicationRecord
  belongs_to :vehicle_type
  validates :vehicle_type, :patente, presence: true
end
