require_relative 'game'
require_relative 'player'

knuckleheads = Game.new('Knuckleheads')
knuckleheads.load_players(ARGV.shift || 'players.csv')

loop do
  puts "How many game rounds? ('quit' to exit)"
  rounds = gets.chomp.downcase
  case rounds
  when /^\d+$/
    puts "Enjoy your #{rounds} rounds..."
    knuckleheads.play(rounds.to_i)
  when 'quit', 'exit'
    knuckleheads.print_stats
    break
  else
    puts "Please enter a number or 'quit'"
  end
end

knuckleheads.save_high_scores
