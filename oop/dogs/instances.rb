require_relative "good_dog.rb" 
require_relative "bad_dog.rb" 

chas = GoodDog.new
chas.speak "Woof"
chas.action

gibsta = BadDog.new
gibsta.speak "Woof"
gibsta.action

puts "--- GoodDog ancestors ---"
puts GoodDog.ancestors
puts ""
puts "--- BadDog ancestors ---"
puts BadDog.ancestors