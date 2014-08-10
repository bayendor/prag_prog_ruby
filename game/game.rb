require_relative 'player'
require_relative 'game_turn'
require_relative 'treasure_trove'

class Game
  attr_reader :title

  def initialize(title)
    @title = title
    @players = []
  end

  def add_player(player)
    @players.push(player)
  end

  def play(rounds)
    puts "\nThere are #{@players.size} players in #{@title}."

    @players.each do |player|
      puts player
    end

    treasures = TreasureTrove::TREASURES
    puts "\nThere are #{treasures.size} treasures to be found:"

    treasures.each do |treasure|
      puts "A #{treasure.name} is worth #{treasure.points} points"
    end

    1.upto(rounds) do |round|
      if block_given?
        break if yield
      end
      puts "\nRound #{round}:"
      @players.each do |player|
        GameTurn.take_turn(player)
      end
    end
  end

  def print_name_and_health(player)
    puts "#{player.name} (#{player.health})"
  end

  def print_high_scores
    puts "\n#{@title} High Scores:"
    @players.sort.each do |player|
      formatted_name = player.name.ljust(20, '.')
      puts "#{formatted_name}#{player.score}"
    end
  end

  def total_points
    @players.reduce(0) { |sum, player| sum + player.points }
  end

  def print_stats
    puts "\n#{@title} Statistics:"

    strong_play, wimpy_play = @players.partition { |player| player.strong? }

    puts "\n#{strong_play.size} strong players:"
    strong_play.each do |player|
      print_name_and_health(player)
    end

    puts "\n#{wimpy_play.size} wimpy players:"
    wimpy_play.each do |player|
      print_name_and_health(player)
    end

    @players.each do |player|
      puts "\n#{player.name}'s point totals:"
      player.each_found_treasure do |treasure|
        puts "#{treasure.points} total #{treasure.name} points"
      end
      puts "#{player.points} grand total points"
    end
    print_high_scores

    print "\n#{total_points} total points from treasures found"
  end
end

if __FILE__ == $0
  player1 = Player.new('moe')
  singleton = Game.new('Singleton')
  singleton.add_player(player1)
  singleton.play(1)
end
