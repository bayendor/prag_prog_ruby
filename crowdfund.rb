# Bonus Project - Crowdfunding
class Project

  attr_reader :target_funding_amount, :funding
  attr_accessor :name

  def initialize(name, target_funding_amount, funding = 0)
    @name = name
    @target = target_funding_amount
    @funding = funding
  end

  def to_s
    "#{@name} has $#{@funding} in funding towards a goal of $#{@target}."
  end

  def remove_funds
    @funding -= 15
    puts "#{@name} lost some funds!"
  end

  def add_funds
    @funding += 25
    puts "#{@name} got more funds!"
  end

  def name=(new_name)
    @name = new_name
  end

  def funding_needed
    @target - @funding
  end
end

project1 = Project.new('Project ABC', 5000, 1000)
puts project1

project2 = Project.new('Project LMN', 3000, 500)
puts project2

project3 = Project.new('Project XYZ', 75, 25)
puts project3

project4 = Project.new('Project TBD', 10_000)
puts project4

puts '***'
project1.remove_funds
project2.remove_funds
project3.add_funds
project4.add_funds
puts '***'

project1.name = 'Project DEF'
puts project1
puts project1.funding_needed
puts project2
puts project3
puts project4


