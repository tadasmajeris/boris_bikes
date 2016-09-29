class Bike

  def initialize
    @working = true
  end

  def working?
    @working
  end

  def mark_as_broken
    @working = false
  end
end
