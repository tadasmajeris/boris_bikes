require_relative 'bike'

class DockingStation
  DEFAULT_CAPACITY = 20
  def initialize
    @twentybikes = []
  end

	def release_bike
    raise "Oh no! No bikes available!" if empty?
    @twentybikes.pop
	end

	def dock(bike)
    fail 'Docking station full' if full?
		@twentybikes << bike
	end

	attr_reader :bike

  private

  def full?
    @twentybikes.count >= DEFAULT_CAPACITY
  end

  def empty?
    @twentybikes.empty?
  end

end
