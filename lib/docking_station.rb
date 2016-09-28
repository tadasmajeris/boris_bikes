require_relative 'bike'

class DockingStation
  def initialize
    @twentybikes = []
  end
	def release_bike
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
	end
	attr_reader :bike
end
