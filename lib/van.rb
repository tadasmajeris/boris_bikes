class Van < DockingStation
  DEFAULT_CAPACITY = 10

  def load(bike)
    fail 'Van is full' if full?
    add_bike(bike)
  end

  def unload
    @bikes.slice!(0, @bikes.count)
  end

end
