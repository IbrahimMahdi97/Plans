require 'rails_helper'

RSpec.describe "flights/index", type: :view do
  current_user = User.first_or_create!(email:'ibrahim@mail.com', password:'123456', password_confirmation:'123456')
  before(:each) do
    assign(:flights, [
      Flight.create!(
        fromairport: 'Doha',
        toairport: 'Dubai',
        user: current_user
      ),
      Flight.create!(
        fromairport: 'Doha',
        toairport: 'Dubai',
        user: current_user
      )
    ])
  end

  it "renders a list of flights" do
    render
    assert_select 'tr>td', text: 'Doha'.to_s, count: 2
    assert_select 'tr>td', text: 'Dubai'.to_s, count: 2
    assert_select 'tr>td', text: current_user.id.to_s, count: 2
  end
end
