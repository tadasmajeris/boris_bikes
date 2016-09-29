class Van
  attr_reader :capacity, :bikes

  DEFAULT_CAPACITY = 10

  def initialize(capacity=DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
  end

  def load(bike)
    fail 'Van is full' if full?
    @bikes << bike
    @bikes.last
  end

  def unload
    @bikes.slice!(0, @bikes.count)
  end

  def full?
    bikes.count >= DEFAULT_CAPACITY
  end

  def empty?
    @bikes.empty?
  end
end
