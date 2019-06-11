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

    def pivot(domain, name)
        @domain = domain
        @name = name
    end

    def self.all
        @@all
    end

    def self.find_by_founder(founder_name)
        self.all.find do |startup|
            startup.founder == founder_name
        end
    end

    def self.domains
        self.all.map do |startup|
            startup.domain
        end
    end



    def sign_contract(venture_capitalist, type, investment)
        FundingRound.new(self, venture_capitalist, type, investment)
    end

    def num_funding_rounds
        FundingRound.all.select do |round|
            round.startup == self
        end.length
    end

    def total_funds
        rounds = FundingRound.all.select do |round|
            round.startup == self
        end
        investments = rounds.map do |round|
            round.investment
        end
        return investments.sum
    end

    def investors
        rounds = FundingRound.all.select do |round|
            round.startup == self
        end
        rounds.map do |round|
            round.venture_capitalist
        end.uniq
    end

    def big_investors
        self.investors.select do |investor|
            investor.tres_commas_club
        end
    end
end
