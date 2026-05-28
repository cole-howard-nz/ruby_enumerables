require_relative "dog.rb"

class BadDog
    include Dog

    def initialize
        puts "A bad dog has been born"
    end
    
    def action
        puts "Poo in the house"
    end
end