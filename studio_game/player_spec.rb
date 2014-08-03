require_relative 'spec_helper'
require_relative 'player'

describe Player do

  before do
    $stdout = StringIO.new
    @initial_health = 100
    @initial_score = 5
    @player = Player.new('larry', @initial_health)
  end

  it 'has a capitalized name' do
    expect(@player.name).to eq 'Larry'
  end

  it 'has an intial health' do
    expect(@player.health).to eq @initial_health
  end

  it 'has a string representation' do
    expect(@player.to_s).to eq "I'm Larry with a health of 100 and a score of 105."
  end

  it 'computes a score as the sum of its health and length of name' do
    expect(@player.score).to eq(@initial_health + @initial_score)
  end

  it 'increases health by 15 when w00ted' do
    @player.w00t
    expect(@player.health).to eq(@initial_health + 15)
  end

  it 'decreases health by 10 when blammed' do
    @player.blam
    expect(@player.health).to eq(@initial_health - 10)
  end

  context 'created with a default health' do
    before do
      @player = Player.new('larry')
    end

    it 'has a health of 100' do
      expect(@player.health).to eq @initial_health
    end
  end
end
