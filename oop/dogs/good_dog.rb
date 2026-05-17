require_relative "dog.rb"

class GoodDog
    include Dog

    def initialize(name = "Unknown")
        @name = name
        puts "A good dog has been born."
    end

    def speak
        puts "#{ @name } says woof!"
    end
end