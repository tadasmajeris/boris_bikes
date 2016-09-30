require_relative 'bike'

class DockingStation

  DEFAULT_CAPACITY = 20

  attr_reader :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
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

  # def deliver_broken_bikes
  #   broke = []
  #   @bikes.each{|x| if x.working? == false
  #     broke.push(x)
  #     bikes.delete(x)
  #     end
  #     }
  #  broke
  # end

  private

  attr_reader :bikes

  def full?
    bikes.count >= capacity
  end

  def empty?
    bikes.empty?
  end

end
