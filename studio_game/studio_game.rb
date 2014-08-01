# Lesson 6 8/1/14
class Player
  def initialize(name, health = 100)
    @name = name.capitalize
    @health = health
  end

  def blam
    puts "#{@name} got blammed!"
    @health -= 10
  end

  def w00t
    puts "#{@name} got w00ted!"
    @health += 15
  end

  def time
    current_time = Time.new
    current_time.strftime('%I:%M:%S')
  end

  def to_s
    "I'm #{@name} with a health of #{@health}."
  end
end

player1 = Player.new('moe')
puts player1

player2 = Player.new('larry', 60)
puts player2

player3 = Player.new('curly', 125)
puts player3

player3.blam
puts player3

player3.w00t
puts player3
