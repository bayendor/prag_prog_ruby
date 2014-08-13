require_relative './flicks/movie'

movie1 = Movie.new('goonies', 7)
movie2 = Movie.new('ghostbusters', 8)
movie3 = Movie.new('goldfinger', 9)

movies = [movie1, movie2, movie3]

File.readlines('movies.csv').each do |line|
  title, rank = line.split(',')
  movie = Movie.new(title, rank.to_i)
  puts movie
end

File.open('movie_rankings.csv', 'w') do |file|
  movies.sort.each do |movie|
    file.puts "#{movie.title}, #{movie.rank}"
  end
end
