require_relative 'docking_station'
class Van

  def pickup(station)
    @twentybikes.select{ |x| x.!working?}
  end
end
