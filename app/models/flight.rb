class Flight < ApplicationRecord
  belongs_to :origin, class_name: 'Airport'
  belongs_to :destination, class_name: 'Airport'
  has_many :bookings
  has_many :passengers, through: :bookings

  scope :by_time, -> { order(flight_time: :asc) }

  def human_time
    "#{(flight_time) / 60}:#{((flight_time) % 60).to_s.rjust(2, "0")}" 
  end
end
