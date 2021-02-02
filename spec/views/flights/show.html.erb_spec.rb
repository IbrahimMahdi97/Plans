require 'rails_helper'

RSpec.describe "flights/show", type: :view do
  current_user = User.first_or_create!(email:'ibrahim@mail.com', password:'123456', password_confirmation:'123456')
  before(:each) do
    @flight = assign(:flight, Flight.create!(
      user: current_user
    ))
  end

  it "renders attributes in <p>" do
    render
  end
end
