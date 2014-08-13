require_relative 'game'
require_relative 'player'

player1 = Player.new('moe')
player2 = Player.new('larry', 60)
player3 = Player.new('curly', 125)

knuckleheads = Game.new('Knuckleheads')
knuckleheads.add_player(player1)
knuckleheads.add_player(player2)
knuckleheads.add_player(player3)

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
