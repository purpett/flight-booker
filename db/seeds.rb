# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

DURATIONS = {
  'LGW' => {
    'EDI' => 70,
    'GLA' => 72,
    'FCO' => 132,
    'MXP' => 95,
    'NAP' => 146,
    'PSA' => 113,
    'MAD' => 118,
    'BCN' => 110,
    'AGP' => 150,
    'IBZ' => 130,
    'TFS' => 245,
    'VLC' => 124,
    'JFK' => 443
  },

  'EDI' => {
    'GLA' => 20,
    'FCO' => 132,
    'MXP' => 95,
    'NAP' => 146,
    'PSA' => 113,
    'MAD' => 118,
    'BCN' => 110,
    'AGP' => 150,
    'IBZ' => 130,
    'TFS' => 245,
    'VLC' => 124,
    'JFK' => 443
  },

  'GLA' => {
    'FCO' => 132,
    'MXP' => 95,
    'NAP' => 146,
    'PSA' => 113,
    'MAD' => 118,
    'BCN' => 110,
    'AGP' => 150,
    'IBZ' => 130,
    'TFS' => 245,
    'VLC' => 124,
  },

  'FCO' => {
    'MXP' => 55,
    'NAP' => 25,
    'PSA' => 15,
    'MAD' => 118,
    'BCN' => 110,
    'AGP' => 150,
    'IBZ' => 130,
    'TFS' => 245,
    'VLC' => 124,
  },

  'MXP' => {
    'NAP' => 63,
    'PSA' => 40,
    'MAD' => 118,
    'BCN' => 110,
    'AGP' => 150,
    'IBZ' => 130,
    'TFS' => 245,
    'VLC' => 124,
    'JFK' => 443
  },

  'NAP' => {
    'PSA' => 45,
    'MAD' => 118,
    'BCN' => 110,
    'AGP' => 150,
    'IBZ' => 130,
    'TFS' => 245,
    'VLC' => 124,
    'JFK' => 443
  },

  'PSA' => {
    'MAD' => 118,
    'BCN' => 110,
    'AGP' => 150,
    'IBZ' => 130,
    'TFS' => 245,
    'VLC' => 124,
    'JFK' => 443
  },

  'MAD' => {
    'BCN' => 45,
    'AGP' => 50,
    'IBZ' => 70,
    'TFS' => 73,
    'VLC' => 32,
  },

  'BCN' => {
    'AGP' => 50,
    'IBZ' => 70,
    'TFS' => 73,
    'VLC' => 32,
    'JFK' => 443
  },

  'AGP' => {
    'IBZ' => 70,
    'TFS' => 73,
    'VLC' => 32,
    'JFK' => 443
  },

  'IBZ' => {
    'TFS' => 73,
    'VLC' => 32,
    'JFK' => 443
  },

  'TFS' => {
    'VLC' => 32,
    'JFK' => 443
  },

  'VLC' => {
    'JFK' => 443
  },

  'JFK' => {}
}

airports = []
airports << Airport.create(code: 'LGW', name: "London Gatwick")
airports << Airport.create(code: 'EDI', name: "Edinburgh")
airports << Airport.create(code: 'GLA', name: "Glasgow")
airports << Airport.create(code: 'FCO', name: "Rome")
airports << Airport.create(code: 'MXP', name: "Milan")
airports << Airport.create(code: 'NAP', name: "Naples")
airports << Airport.create(code: 'PSA', name: "Pisa")
airports << Airport.create(code: 'MAD', name: "Madrid")
airports << Airport.create(code: 'BCN', name: "Barcelona")
airports << Airport.create(code: 'AGP', name: "Malaga")
airports << Airport.create(code: 'IBZ', name: "Ibiza")
airports << Airport.create(code: 'TFS', name: "Tenerife")
airports << Airport.create(code: 'VLC', name: "Valencia")
airports << Airport.create(code: 'JFK', name: "New York")

# DURATIONS is a constant. [o][d] nested!!! OR (if null then ->) [d][o]
def get_duration(origin, destination)
  DURATIONS[origin][destination] || DURATIONS[destination][origin]
end

def random_minute
  rand(60 * 24)
end

Date.today.upto(Date.today + 60).each do |date|
  airports.each do |origin|
    airports.each do |destination|
      next if origin == destination

      3.times do
        Flight.create(
          flight_date: date,
          flight_time: random_minute,
          origin: origin,
          destination: destination,
          duration: get_duration(origin.code, destination.code)
        )
      end
    end
  end
end