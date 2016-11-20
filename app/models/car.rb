class Car < ActiveRecord::Base
	has_many :bookings
	has_many :rides

	def self.available
		return where(availability: true)
	end

	def total_distance(booking, ride)
		delta_lat = (ride.droplat - booking.picklat)
 		delta_lng = (ride.droplng - booking.picklng)
 		distance = Math.sqrt(delta_lat*delta_lat + delta_lng*delta_lng)
 		return distance.to_i
	end
end
