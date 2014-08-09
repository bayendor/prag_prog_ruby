# Fun with hashes and reduce!

letters = { 'c' => 3, 'e' => 1, 'l' => 1, 'n' => 1, 't' => 1, 'x' => 8,
            'y' => 4 }

word = 'excellently'
point_totals = Hash.new(0)
score = 0

word.each_char { |char| score += letters[char] }

puts score

word.each_char { |c| point_totals[c] += letters[c] }

puts point_totals

puts "#{point_totals.values.reduce(0, :+)}"
