require_relative 'bike'

class DockingStation
  def initialize
    @twentybikes = []
  end
	def release_bike
<<<<<<< HEAD
    raise "Oh no! No bikes available!" unless @bike
		@bike
	end
	def dock(bike)
		raise "Oh no! There's already a bike here!" if @bike
		@bike = bike
=======
    raise "Oh no! No bikes available!" if @twentybikes.empty?
    @twentybikes.pop
	end
	def dock(bike)
    #if @twentybikes.length < 20
    #    @twentybikes.push(bike)
    #else
    #  "no more bikes"
    #end
    fail 'Docking station full' if @twentybikes.count >= 20
		@twentybikes << bike
>>>>>>> fb09817f6b72abe4e2ba1f9e21da75835918c6d9
	end
	attr_reader :bike
end
