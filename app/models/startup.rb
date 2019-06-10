class Startup
  @@all = []

  attr_accessor :name
  attr_reader :founder, :domain

  def initialize(name, founder, domain)
    @name = name
    @founder = founder
    @domain = domain
    @@all << self
  end

  def self.all
    @@all
  end

  def self.find_by_founder(name)
    @@all.find do |startup|
      startup.founder == name
    end
  end

  def self.domains
    @@all.map do |startup|
      startup.domain
    end.uniq
  end

  def funding_rounds
    FundingRound.all.select do |funding_round|
      funding_round.startup == self
    end
  end

  def num_funding_rounds
    funding_rounds.size
  end

  def total_funds
    funding_rounds.inject(0) do |sum, round|
      sum + round.investment
    end
  end

  def investors
    funding_rounds.map do |funding_round|
      funding_round.venture_capitalist
    end.uniq
  end

  def big_investors
    investors & VentureCapitalist.tres_commas_club
  end

  def pivot(new_name, new_domain)
    @name = new_name
    @domain = new_domain
  end

  def sign_contract(venture_capitalist, type, investment)
    FundingRound.new(self, venture_capitalist, type, investment)
  end
end
