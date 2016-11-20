class Api::V1::BookingsController < Api::V1::ApiController

  before_action :set_booking_and_car, only: [:show, :edit, :update, :destroy]

  layout false
  respond_to :json

  def index
    @bookings = Booking.all
  end

  def show
    render json: {success: true, status: 200, booked: { car: @car, booking: @booking} }
  end

  def new
    @booking = Booking.new
  end

  def edit
  end

  def create
    @booking = Booking.new(booking_params)

    respond_to do |format|
      if @booking.save
        format.html { redirect_to @booking, notice: 'Booking was successfully created.' }
        format.json { render :show, status: :created, location: @booking }
      else
        format.html { render :new }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @booking.update(booking_params)
        format.html { redirect_to @booking, notice: 'Booking was successfully updated.' }
        format.json { render :show, status: :ok, location: @booking }
      else
        format.html { render :edit }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @booking.destroy
    respond_to do |format|
      format.html { redirect_to bookings_url, notice: 'Booking was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_booking_and_car
      @car = Car.find(params[:car_id])
      @booking = Booking.find(params[:id])
    end

    def booking_params
      params.require(:booking).permit(:picklat, :picklng)
    end
end
