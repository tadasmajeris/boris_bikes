require_relative 'bike'

class DockingStation
  def initialize
    @twentybikes = []
  end
	def release_bike
    raise "Oh no! No bikes available!" if @twentybikes.empty?
    @twentybikes.pop
	end
  def full?
    @twentybikes.count >= 20
  end
	def dock(bike)
    fail 'Docking station full' if full?
		@twentybikes << bike
	end
	attr_reader :bike

end
