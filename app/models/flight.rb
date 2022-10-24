class Flight < ApplicationRecord
  belongs_to :origin, class_name: 'Airport'
  belongs_to :destination, class_name: 'Airport'

  scope :by_time, -> { order(flight_time: :asc) }
end
