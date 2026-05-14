require_relative "dog.rb"

class BadDog
    include Dog
    
    def action
        puts "Poo in the house"
    end
end