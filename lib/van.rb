
class Van < DockingStation
  DEFAULT_CAPACITY = 10


  def load(bike)
    fail 'Docking station full' if full?
		bikes.push(bike)
    bikes.last
  end

  def unload
  end

end
