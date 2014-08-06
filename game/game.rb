require_relative 'player'
require_relative 'game_turn'

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
    puts "There are #{@players.size} players in #{@title}."

    @players.each do |player|
      puts player
    end

    1.upto(rounds) do |round|
      puts "\nRound #{round}:"
      @players.each do |player|
        GameTurn.take_turn(player)
        puts player
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

    print_high_scores
  end
end

if __FILE__ == $0
  player1 = Player.new('moe')
  singleton = Game.new('Singleton')
  singleton.add_player(player1)
  singleton.play(1)
end
