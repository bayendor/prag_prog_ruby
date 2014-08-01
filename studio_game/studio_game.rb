# Lesson 8 - Attributes
class Player
  attr_accessor :name
  attr_reader :health, :score

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

  def score
    @health + @name.length
  end

  def name=(new_name)
    @name = new_name.capitalize
  end

  def time
    current_time = Time.new
    current_time.strftime('%I:%M:%S')
  end

  def to_s
    "I'm #{@name} with a health of #{@health} and a score of #{score}."
  end
end

player2 = Player.new('larry', 60)
puts player2.name
player2.name = 'lawrence'
puts player2.name
puts player2.health
puts player2.score
puts player2
