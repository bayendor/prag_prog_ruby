require_relative 'movie'
require_relative 'playlist'
require_relative 'movie3d'

playlist = Playlist.new('Kermit')
playlist.load(ARGV.shift || 'movies.csv')
movie3d = Movie3D.new('glee', 5, 7)
playlist.add_movie(movie3d)

loop do
  puts "\nHow many viewings? ('quit' to exit)"
  answer = gets.chomp.downcase
  case answer
  when /^\d+$/
    puts "Enjoy your #{answer} viewings..."
    playlist.play(answer.to_i)
  when 'quit', 'exit'
    playlist.print_stats
    break
  else
    puts "Please enter a number or 'quit'"
  end
end

playlist.save
