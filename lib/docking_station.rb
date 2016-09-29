require_relative 'bike'

class DockingStation

  attr_reader :capacity

  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
  end

  def release_bike
    fail "No bikes available" if empty?
    bikes.pop
  end

  def dock(bike, working=true)
    fail 'Docking station is full' if full?
    bike.mark_as_broken if !working
    bikes << bike
    bikes.last
  end

  private

  attr_reader :bikes

  def empty?
    bikes.empty?
  end

  def full?
    bikes.count >= capacity
  end
end
