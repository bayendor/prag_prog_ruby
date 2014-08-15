require_relative 'treasure_trove'
require_relative 'playable'

class Player
  include Playable

  attr_accessor :health
  attr_reader :name, :score

  def initialize(name, health = 100)
    @name = name.capitalize
    @health = health
    @found_treasures = Hash.new(0)
  end

  def found_treasure(treasure)
    @found_treasures[treasure.name] += treasure.points
    puts "#{@name} found a #{treasure.name} worth #{treasure.points} points."
  end

  def each_found_treasure
    @found_treasures.each do |name, points|
      yield Treasure.new(name, points)
    end
  end

  def points
    @found_treasures.values.reduce(0, :+)
  end

  def score
    @health + points
  end

  def name=(new_name)
    @name = new_name.capitalize
  end

  def time
    current_time = Time.new
    current_time.strftime('%I:%M:%S')
  end

  def to_s
    "I'm #{@name} with a health of #{@health}, and a score of #{score}."
  end

  def self.from_csv(line)
    name, health = line.split(',')
    Player.new(name, Integer(health))
  end

  def <=>(other_player)
    other_player.score <=> score
  end
end

if __FILE__ == $0
  player = Player.new('moe')
  puts player.name
  puts player.health
  player.w00t
  puts player.health
  player.blam
  puts player.health
end
