 require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe "/flights", type: :request do
  # Flight. As you add validations to Flight, be sure to
  # adjust the attributes here as well.
  current_user = User.first_or_create(email:'ibrahim@mail.com', password:'123456', password_confirmation:'123456')
  let(:valid_attributes) do {
      id: '1',
      fromairport: 'Riyadh',
      toairport: 'Jeddah',
      user: current_user
    }
  end

  let(:invalid_attributes) do {
    id: 'v',
    fromairport: '',
    toairport: ''
  }
end

  describe "GET /index" do
    it "renders a successful response" do
      # Flight.create! valid_attributes
      # get flights_url
      # expect(response).to be_successful
      flight = Flight.new(valid_attributes)
      flight.user = current_user
      flight.save
      get flights_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      # flight = Flight.create! valid_attributes
      flight = Flight.new(valid_attributes)
      flight.user = current_user
      flight.save
      get flight_url(flight)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_flight_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "render a successful response" do
      # flight = Flight.create! valid_attributes
      flight = Flight.new(valid_attributes)
      flight.user = current_user
      flight.save
      get edit_flight_url(flight)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Flight" do
        expect do
          post flights_url, params: { flight: valid_attributes }
        end.to change(Flight, :count).by(1)
      end

      it "redirects to the created flight" do
        flight = Flight.new(valid_attributes)
        flight.user = current_user
        flight.save
        post flights_url, params: { flight: valid_attributes }
        expect(response).to redirect_to(flight_url(Flight.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Flight" do
        expect do
          flight = Flight.new(valid_attributes)
          flight.user = current_user
          flight.save
          post flights_url, params: { flight: invalid_attributes }
        end.to change(Flight, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post flights_url, params: { flight: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) do {
        id: '1',
        fromairport: 'Riyadh',
        toairport: 'Jeddah',
        user: current_user
      }
    end

      it "updates the requested flight" do
        # flight = Flight.create! valid_attributes
        flight = Flight.new(valid_attributes)
        flight.user = current_user
        flight.save
        patch flight_url(flight), params: { flight: new_attributes }
        flight.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the flight" do
        # flight = Flight.create! valid_attributes
        flight = Flight.new(valid_attributes)
        flight.user = current_user
        flight.save
        patch flight_url(flight), params: { flight: new_attributes }
        flight.reload
        expect(response).to redirect_to(flight_url(flight))
      end
    end

    context "with invalid parameters" do
      it "renders a successful response (i.e. to display the 'edit' template)" do
        # flight = Flight.create! valid_attributes
        flight = Flight.new(valid_attributes)
        flight.user = current_user
        flight.save
        patch flight_url(flight), params: { flight: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested flight" do
      # flight = Flight.create! valid_attributes
      flight = Flight.new(valid_attributes)
      flight.user = current_user
      flight.save
      expect {
        delete flight_url(flight)
      }.to change(Flight, :count).by(-1)
    end

    it "redirects to the flights list" do
      # flight = Flight.create! valid_attributes
      flight = Flight.new(valid_attributes)
      flight.user = current_user
      flight.save
      delete flight_url(flight)
      expect(response).to redirect_to(flights_url)
    end
  end
end
