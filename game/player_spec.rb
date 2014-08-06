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
    expect(@player.to_s).to include('Larry', 'health of 100', 'score of 105.')
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

    it 'is not strong' do
      expect(@player).not_to be_strong
    end
  end

  context 'with a health greater than 100' do
    before do
      @player = Player.new('larry', 150)
    end

    it 'is strong' do
      expect(@player).to be_strong
    end
  end

  context "in a collection of players" do
    before do
      @player1 = Player.new("moe", 100)
      @player2 = Player.new("larry", 200)
      @player3 = Player.new("curly", 300)

      @players = [@player1, @player2, @player3]
    end

    it "is sorted by decreasing score" do
      expect(@players.sort).to eq([@player3, @player2, @player1])
    end
  end
end
