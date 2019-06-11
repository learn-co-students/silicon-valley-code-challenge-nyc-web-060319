class VentureCapitalist
    @@all = []
    attr_accessor :name, :total_worth

    def initialize(name, total_worth)
        @name = name
        @total_worth = total_worth
        @@all << self
    end

    def self.all
        @@all
    end

    def self.tres_commas_club
        self.all.select do |vc|
            vc.total_worth > 1000000000
        end
    end



    def offer_contract(startup, venture_capitalist, type, investment)
        FundingRound.new(startup, self, type, investment)
    end

    def funding_rounds
        FundingRound.all.select do |round|
            round.venture_capitalist == self
        end
    end

    def portfolio
        self.funding_rounds.map do |round|
            round.startup
        end.uniq
    end

    def biggest_investment
        self.funding_rounds.sort.last
    end

    def invested(domain)
        domain_investments = self.funding_rounds.select do |round|
            round.domain == domain
        end
        domain_investments.reduce(:+)
    end
end
