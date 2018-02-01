class Slot < ApplicationRecord
  belongs_to :vehicle_type
  validates :number, uniqueness: true
  validates :number, :vehicle_type_id, presence: true

end
