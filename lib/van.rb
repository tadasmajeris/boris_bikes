require_relative 'docking_station'

class Van

  attr_accessor :cargo

  def pick_up_bikes
    $broke
  end

  def deliver_broken_bikes
    $cargo = []
    $cargo.push($broke)
    $cargo.flatten
  end

end
