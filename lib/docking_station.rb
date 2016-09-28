require_relative 'bike'

class DockingStation
	def release_bike
    raise "Oh no! No bikes available!" unless @bike
	end
	def dock(bike)
		raise "Oh no! There's already a bike here!" if @bike
		@bike = bike
	end
	attr_reader :bike
end
