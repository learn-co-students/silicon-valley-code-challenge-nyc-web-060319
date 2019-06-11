require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

s1 = Startup.new("Krusty Krab", "Mr. Krabs", "food")
s2 = Startup.new("SSDGM", "KNG", "entertainment")

v1 = VentureCapitalist.new("daVinci", 999999)
v2 = VentureCapitalist.new("Riario", 100)

fr1 = FundingRound.new("SSDGM", "daVinci", "entertainment", 5000)
fr2 = FundingRound.new("SSDGM", "Riario", "entertainment", 1000)
fr3 = FundingRound.new("Krusty Krab", "daVinci", "food", 500)

binding.pry
0 #leave this here to ensure binding.pry isn't the last line