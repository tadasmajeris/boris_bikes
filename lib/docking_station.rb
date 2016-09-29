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
    fail "No working bikes available" if no_working_bikes?
    get_a_working_bike
  end

  def get_a_working_bike
    bike = find_a_working_bike
    bikes.delete(bike)
  end

  def find_a_working_bike
    bikes.select{|bike| bike.working?}.last
  end

  def dock(bike)
    fail 'Docking station is full' if full?
    bikes << bike
    bikes.last
  end

  private

  attr_reader :bikes

  def no_working_bikes?
    bikes.select{|bike| bike.working?}.count <= 0
  end

  def empty?
    bikes.empty?
  end

  def full?
    bikes.count >= capacity
  end
end
