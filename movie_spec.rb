require_relative 'movie'

describe Movie do

  before  do
    @initial_rank = 10
    @movie = Movie.new('goonies', @initial_rank)
  end

  it "has a capitalized title" do
    expect(@movie.title).to eq 'Goonies'
  end

  it "has an initial rank" do
    expect(@movie.rank).to eq 10
  end

  it "has a string representation" do
    expect(@movie.to_s).to eq "Goonies has a rank of 10 (Hit)"
  end

  it "increases rank by 1 with thumbs up" do
    @movie.thumbs_up
    expect(@movie.rank).to eq @initial_rank + 1
  end

  it "decreases rank by 1 with thumbs down" do
    @movie.thumbs_down
    expect(@movie.rank).to eq @initial_rank - 1
  end

  context "created with a default rank" do
    before do
      @movie = Movie.new("goonies")
    end

    it "has a rank of 0" do
      expect(@movie.rank).to eq 0
    end
  end

  context "with a rank of at least 10" do
    before do
      @movie = Movie.new("goonies", 10)
    end

    it "is a hit" do
      expect(@movie).to be_hit
    end

    it "has a hit status" do
      expect(@movie.status).to include("Hit")
    end
  end

  context "with a rank of less than 10" do
    before do
      @movie = Movie.new("goonies", 9)
    end
    it "is not a hit" do
      expect(@movie).to_not be_hit
    end

    it "has a flop status" do
      expect(@movie.status).to include("Flop")
    end
  end
end