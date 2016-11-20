class Booking < ActiveRecord::Base
	belongs_to :car
	has_one :ride
end
