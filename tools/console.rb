require_relative "../config/environment.rb"

def reload
  load "config/environment.rb"
end

# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object
# instances,
# so they will be available to test and play around with in your console

s1 = Startup.new("Facebook", "Zuck", "SM")
s2 = Startup.new("Twitter", "Dingus", "SM")
s3 = Startup.new("Amazon", "Bezos", "Retail")

v1 = VentureCapitalist.new("Evan", 1_000_001)
v2 = VentureCapitalist.new("Ariel", 999_999)

s1.sign_contract(v1, "a1", 1000)
s3.sign_contract(v1, "a3", 5000)
s1.sign_contract(v2, "a2", 10_000)

v1.offer_contract(s2, "angel", 20_000)

binding.pry
0 #leave this here to ensure binding.pry isn't the last line
