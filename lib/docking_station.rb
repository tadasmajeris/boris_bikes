require_relative "bike"

class DockingStation
  attr_reader :bike

  def release_bike
    fail 'No bikes available' if @bike.nil?
    @bike
  end

  def dock(bike)
    @bike = bike
  end
end
