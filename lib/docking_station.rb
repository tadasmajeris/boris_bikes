require_relative 'bike'

class DockingStation

  DEFAULT_CAPACITY = 20

  attr_reader :capacity

  def initialize(capacity = self.class::DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
  end

  def release_bike
    raise "Oh no! No bikes available!" if empty?
    raise "Oh no! No working bikes available" if no_working_bikes?
    get_a_working_bike
  end

  def get_a_working_bike
    bike = find_a_working_bike
    bikes.delete(bike)
  end

  def no_working_bikes?
    find_a_working_bike.nil?
  end

  def find_a_working_bike
    bikes.select{|bike| bike.working?}.last
end

	def dock(bike)
    fail 'Docking station full' if full?
		bikes.push(bike)
    bikes.last
 	end

   def find_broken_bikes
    bikes.select{|x| x.working? == false}
  end

  def offload_bikes(target_bikes)
    target_bikes.each{ |bike| bikes.delete(bike) }
  end

  def empty?
    bikes.empty?
  end

  private

  attr_reader :bikes

  def full?
    bikes.count >= capacity
  end

end
