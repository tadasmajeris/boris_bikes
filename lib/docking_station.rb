require_relative 'bike'
require_relative 'van'
require_relative 'garage'

class DockingStation

  DEFAULT_CAPACITY = 20

  attr_reader :capacity, :twentybikes
  #attr_accessor :broke

  def initialize(capacity = DEFAULT_CAPACITY)
    @twentybikes = []
    @capacity = capacity
    $broke = []
  end

  def release_bike
    raise "Oh no! No bikes available!" if empty?
    raise "Oh no! This bike is broken" if twentybikes.last.working? == false
    twentybikes.pop
  end

	def dock(bike)
    fail 'Docking station full' if full?
		twentybikes.push(bike)
 	end

 def select_broken_bikes
    @twentybikes.each{|x| if x.working? == false
      $broke.push(x)
      twentybikes.delete(x)
      end
      }
   $broke
  end


  private

  attr_reader :bikes

  def full?
    twentybikes.count >= capacity
  end

  def empty?
    twentybikes.empty?
  end

end
