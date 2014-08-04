class Die
  attr_reader :number

  def intialize
    roll
  end

  def roll
    @number = rand(1..6)
  end
end
