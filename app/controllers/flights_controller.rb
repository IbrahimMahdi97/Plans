class FlightsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_flight, only: [:show, :edit, :update, :destroy]

  # GET /flights
  # GET /flights.json
  def index
    @flights = Flight.all
  end

  def search
    @flights = Flight.where("fromairport LIKE ?", "%" + params[:q] + "%")
    # unless @flights
    #   redirect_to @flight
    #   # format.html { redirect_to @flight, notice: 'No Available Flights in the givin Date' }
    #   # format.json { render :show, status: :unprocessable_entity, location: @flight }
    # end
    # @flights = flights.all
  end 


  # GET /flights/1
  # GET /flights/1.json
  def show
    @flight = Flight.find(params[:id])
  end

  
  
  # GET /flights/new
  def new
    @flight = Flight.new
    @flight.user_id = current_user.id
  end

  # GET /flights/1/edit
  def edit
    @flight = Flight.find(params[:id])
  end

  # POST /flights
  # POST /flights.json
  def create
    @flight = Flight.new(flight_params)
    @flight.user_id = current_user.id
    respond_to do |format|
      if @flight.save!
        format.html { redirect_to @flight, notice: 'Flight was successfully created.' }
        format.json { render :show, status: :created, location: @flight }
      else
        format.html { render :new }
        format.json { render json: @flight.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /flights/1
  # PATCH/PUT /flights/1.json
  def update
    respond_to do |format|
      if @flight.update(flight_params)
        format.html { redirect_to @flight, notice: 'Flight was successfully updated.' }
        format.json { render :show, status: :ok, location: @flight }
      else
        format.html { render :edit }
        format.json { render json: @flight.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /flights/1
  # DELETE /flights/1.json
  def destroy
    @flight.destroy
    respond_to do |format|
      format.html { redirect_to flights_url, notice: 'Flight was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_flight
      @flight = Flight.where(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def flight_params
      params.require(:flight).permit(
        :fromairport, 
        :toairport, 
        :flightno, 
        :planename, 
        :planno, 
        :totalseats, 
        :departure, 
        :arrival, 
        :user_id
      )
      # params.fetch(:flight, {:fromairport; :toairport; :flightno; :planname; :planno; :totalseats; :departure; :arrival})
    end
    # def request_api(url)
    #   response = Excon.get(
    #     url,
    #     headers: {
    #       'X-RapidAPI-Host' => URI.parse(url).host,
    #       'X-RapidAPI-Key' => ENV.fetch('RAPIDAPI_API_KEY')
    #     }
    #   )
    #   return nil if response.status != 200
    #   JSON.parse(response.body)
    # end
    # def find_flights(_)
    #   request_api(
    #     # "https://aerodatabox.p.rapidapi.com/flights/%7BsearchBy%7D/KL1395/dates/#{URI.encode(dates)}"
    #     "https://aerodatabox.p.rapidapi.com/flights/%7BsearchBy%7D/KL1395/dates/2021-06-01/2021-06-15"
    #   )
    # end
end
