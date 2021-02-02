require 'rails_helper'

RSpec.describe "flights/new", type: :view do
  current_user = User.first_or_create!(email:'ibrahim@mail.com', password:'123456', password_confirmation:'123456')
  before(:each) do
    assign(:flight, Flight.new(
      user: current_user
    ))
  end

  it "renders new flight form" do
    render

    assert_select "form[action=?][method=?]", flights_path, "post" do
    end
  end
end
