# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'net/http'
require 'json'
require 'open-uri'
    params = {
      :access_key => "a3a1c3aeb7b1df423883726a61806479"
    }
    url = 'http://api.aviationstack.com/v1/flights?access_key=a3a1c3aeb7b1df423883726a61806479'
    flights_info = open(url).read
    flights = JSON.parse(flights_info)
    flights['data'].each do |f|
      new_flight = Flight.create(
        flightno: f['flight']['number'],
        planno: '',
        planename: f['airline']['name'],
        fromairport: f['departure']['airport'],
        toairport: f['arrival']['airport'],
        user_id: 1,
        totalseats: 0,
        departure: f['departure']['scheduled'],
        arrival: f['arrival']['scheduled'],
      )
    end 

    
  