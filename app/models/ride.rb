class Ride < ActiveRecord::Base
	belongs_to :booking
	belongs_to :car

	def start_time
		return created_at
	end

	def end_time
		return updated_at if (status == false)
	end

	def total_time
		return TimeDifference.between(end_time, start_time).in_minutes
	end

	def total_dist_cost(car, booking)
		distance = car.total_distance(booking, self)
		return distance * 2
	end

	def miscellaneous_cost
		if miscellaneous
			return 5
		else
			return 0
		end
	end

	def total_cost(car, booking)
		return total_dist_cost(car, booking) + total_time * 1 + miscellaneous_cost
	end

	def miscellaneous
		if (car.color.downcase == "pink")
		  return true
		else
		  return false
	    end
	end
end
