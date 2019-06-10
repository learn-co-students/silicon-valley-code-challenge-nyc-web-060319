class FundingRound
  @@all = []

  attr_reader :startup, :venture_capitalist, :investment
  attr_accessor :type

  def initialize(startup, venture_capitalist, type, investment)
    @startup = startup
    @venture_capitalist = venture_capitalist
    @type = type
    @investment = investment
    @@all << self
  end

  def investment=(investment)
    if investment >= 0
      @investment = investment
    else
      puts "invalid investment"
    end
  end

  def self.all
    @@all
  end
end
