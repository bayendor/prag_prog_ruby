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

player1 = Player.new('moe')
player2 = Player.new('larry', 60)
player3 = Player.new('curly', 125)
player4 = Player.new('shemp', 90)

players = [player1, player2, player3]

puts "There are #{players.size} players in the game:"

players.each do |player|
  puts player
end

players.each do |player|
  puts player.health
end

players.each do |player|
  player.blam
  player.w00t
  player.w00t
  puts player
end

players.pop
players.push(player4)

players.each do |player|
  puts player
end
