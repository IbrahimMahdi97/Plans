require 'rails_helper'

RSpec.describe "flights/edit", type: :view do
  current_user = User.first_or_create!(email:'ibrahim@mail.com', password:'123456', password_confirmation:'123456')
  before(:each) do
    @flight = assign(:flight, Flight.create!(
      user: current_user
    ))
  end

  it "renders the edit flight form" do
    render

    assert_select "form[action=?][method=?]", flight_path(@flight), "post" do
    end
  end
end
