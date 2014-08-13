def n_times(n)
  1.upto(n) do |count|
    yield count
  end
end

n_times(2) do |n|
  puts "#{n} situps"
  puts "#{n} pushups"
  puts "#{n} chinups"
end

def my_select(array)
  results = []
  array.each do |element|
    results << element if yield(element)
  end
  results
end

numbers = (1..10).to_a
puts my_select(numbers) { |n| n.even? }

def conversation
  if block_given?
    puts 'Hello'
    puts yield
    puts 'Goodbye'
  else
    puts 'Nothing to say?'
  end
end

conversation { 'Good to meet you!' }
conversation
