require_relative 'bike'

class DockingStation

  attr_reader :capacity

  DEFAULT_CAPACITY = 20

  def initialize(capacity = self.class::DEFAULT_CAPACITY)
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
    add_bike(bike)
  end

  def empty?
    bikes.empty?
  end

  private

  attr_reader :bikes

  def no_working_bikes?
    bikes.select{|bike| bike.working?}.count <= 0
  end

  def full?
    bikes.count >= capacity
  end

  def add_bike(bike)
    bikes << bike
    bikes.last
  end
end
