require_relative 'game'
require_relative 'player'
require_relative 'clumsy_player'
require_relative 'berserk_player'

knuckleheads = Game.new('Knuckleheads')
knuckleheads.load_players(ARGV.shift || 'players.csv')
knuckleheads.add_player(ClumsyPlayer.new('klutz', 105))
knuckleheads.add_player(BerserkPlayer.new('berserker', 50))

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
