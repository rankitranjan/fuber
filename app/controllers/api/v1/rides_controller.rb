class Api::V1::RidesController < Api::V1::ApiController

  before_action :set_ride_car_and_booking, only: [:show, :edit, :update, :destroy, :end_ride]

  def show
    if @car && @booking && @ride && (@ride.status == true)
      render json: {success: true, status: 200, ride: { car: @car, booking: @booking, ride: @ride} }
    else
      render json: {success: true, status: 200, message: "You have reached your destination at #{@ride.updated_at}", ride: { car: @car, booking: @booking, ride: @ride} }
    end
  end

  def create
    @ride = Ride.new(ride_params)
    @ride.status = true
    @ride.car_id = Car.find(params[:car_id]).id
    @ride.booking_id = Booking.find(params[:booking_id]).id
    if @ride.save
      render json: {success: true, status: 200, ride: { car: @ride.car, booking: @ride.booking, ride: @ride}}
    else
      render :json => {success: false, :errors => @ride.errors.to_a.uniq.join(", ")}, :status => 422
    end
  end

  def end_ride
    @ride.update(status: false, droplat: params[:ride][:droplat], droplng: params[:ride][:droplng])
    total_distance = @car.total_distance(@booking, @ride)
    total_cost = @ride.total_cost(@car, @booking)
    render json: {success: true, status: 200, message: "ride successfully end", ride: { car: @ride.car, booking: @ride.booking, ride: @ride, payment_details: { total_distance: total_distance.to_i.to_s + " x 2 dogecoin", start_at: @ride.start_time, ends_at: @ride.end_time, total_time: @ride.total_time.to_s + " x 1 dogecoin", miscellaneous: @ride.miscellaneous ? "5 dogecoin" : 0, total_cost:  total_cost.to_i.to_s + " dogecoin" }}}
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ride_car_and_booking
      @ride = Ride.find(params[:id])
      @car = Car.find(params[:car_id])
      @booking = Booking.find(params[:booking_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ride_params
      params.require(:ride).permit(:droplat, :droplng, :time_taken)
    end
end
