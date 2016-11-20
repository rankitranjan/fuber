class Api::V1::CarsController < Api::V1::ApiController
  before_action :set_car, only: [:show, :edit, :update, :destroy, :booking]

  layout false
  respond_to :json

  def all_available_cab
    @cars = Car.available
    if !@cars.blank?
      respond_with(@cars)
    else
     render :json => {success: true, :message => "No Car Available"}, :status => 200
    end
  end

  def booking
    if @car.availability
      if params[:booking][:picklat] && params[:booking][:picklng]
        @booking = @car.bookings.new(picklat: params[:booking][:picklat], picklng: params[:booking][:picklng])
        if @booking.save
          @car.update(availability: false)
          render json: {success: true, status: 200, :message => "successfully Booked", picklat: @booking.picklat, picklng: @booking.picklng, car: @car}
        else
          render :json => {success: false, :errors => @booking.errors.to_a.uniq.join(", ")}, :status => 422
        end
      else
        render :json => {success: true, :message => "Invalid detalils"}, :status => 200
      end
    else
      render :json => {success: true, :message => "Booking not Allowed"}, :status => 200
    end
  end

  def index
    @cars = Car.all
  end

  def create
    @car = Car.new(car_params)
    if @car.save
      render json: {success: true, status: 200, color: @car.color, availability: @car.availability, latitude: @car.latitude, longitude: @car.longitude, number: @car.number, owner_name: @car.owner_name, model: @car.model}
    else
      render :json => {success: false, :errors => @car.errors.to_a.uniq.join(", ")}, :status => 422
    end
  end

  def all_available_car
    @cars = Car.available
  end

  private

    def set_car
      @car = Car.find(params[:id])
    end

    def car_params
      params.require(:car).permit(:color, :availability, :latitude, :longitude, :number, :owner_name, :model)
    end
end
