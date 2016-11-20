require 'rails_helper'

RSpec.describe Booking, type: :model do

  before do
    @car1 = Car.new(id: 1, color: "Silver", availability: true, latitude: 23, longitude: 520, number: "MP09AB1231", owner_name: "foo", model: "Xcent")
    @book = Booking.new(picklat: 33, picklng: 520, car_id: @car1.id)
    @ride = Ride.new(droplat: 41, droplng: 400, car_id: @car1.id, booking_id: @book.id)
  end

  it { should belong_to(:car) }

  it { should have_one(:ride) }

end