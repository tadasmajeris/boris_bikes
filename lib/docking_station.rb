require_relative 'bike'

class DockingStation

  def initialize
    @bikes = []
  end

  def release_bike
    fail "No bikes available" if empty?
    @bikes.pop
  end

  def dock(bike)
    fail 'Docking station is full' if full?
    @bikes << bike
    @bikes.last
  end

  private

  def empty?
    @bikes.empty?
  end

  def full?
    @bikes.count >= 20
  end
end
