
class Van < DockingStation
  DEFAULT_CAPACITY = 10

  def load(bike)
    fail "Van full" if full?
		bikes.push(bike)
    bikes.last
  end

  def fill_van(broken_bikes)
    broken_bikes.each{ |bike| load(bike) if !full? }
    bikes
  end

  def unload_all
    bikes.slice!(0, bikes.count)
  end

end
