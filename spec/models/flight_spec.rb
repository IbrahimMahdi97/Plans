require 'rails_helper'

RSpec.describe Flight, type: :model do
  current_user = User.first_or_create!(email:'ibrahim@mail.com', password:'123456', password_confirmation:'123456')
  it 'Has Departure' do
    flight = Flight.new(
      # user(flight)
      fromairport: nil,
      toairport: 'Najaf',
      user: current_user
    )
    expect(flight).to_not be_valid
    flight.fromairport = 'Baghdad'
    expect(flight).to be_valid 
    
  end

  it 'Has Arrival' do
    flight = Flight.new(
      # user(flight)
      fromairport: 'Broxel',
      toairport: '',
      user: current_user
    )
    expect(flight).to_not be_valid
    
    flight.toairport = 'Istanbul'
    expect(flight).to be_valid 
    
  end

end
