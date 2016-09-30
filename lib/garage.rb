class Garage < DockingStation

  DEFAULT_CAPACITY = 500

  def repair(broken_bikes)
    @bikes += broken_bikes
    @bikes.each { |bike| bike.fix }
    @bikes
  end

end
