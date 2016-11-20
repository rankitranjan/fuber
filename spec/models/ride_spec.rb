require 'rails_helper'

RSpec.describe Ride, type: :model do

  before do
    @car1 = Car.new(id: 1, color: "Silver", availability: true, latitude: 23, longitude: 520, number: "MP09AB1231", owner_name: "foo", model: "Xcent")
    @book = Booking.new(picklat: 33, picklng: 520, car_id: @car1.id)
    @ride = Ride.new(droplat: 41, droplng: 400, car_id: @car1.id, booking_id: @book.id, created_at: Time.now, updated_at: Time.now + 12.minutes)
  end

  it { should belong_to(:booking) }
  it { should belong_to(:car) }

  it "should return start time" do
  	expect(@ride.start_time).to eq(@ride.created_at)
  end

  it "should return end time" do
  	@ride = Ride.new(droplat: 41, droplng: 400, status: false, car_id: @car1.id, booking_id: @book.id, created_at: Time.now, updated_at: Time.now + 12.minutes)
  	expect(@ride.end_time).to eq(@ride.updated_at)
  end

  it "should set status to false after end" do
  	@ride = Ride.new(droplat: 41, droplng: 400, status: false, car_id: @car1.id, booking_id: @book.id)
  	expect(@ride.status).to eq(false)
  end

  it "should return total dist cost" do
  	expect(@ride.total_dist_cost(@car1, @book)).to eq(@ride.total_dist_cost(@car1, @book))
  end
end
