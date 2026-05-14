require_relative "dog.rb"

class GoodDog
    include Dog

    def action
        puts "Wait for owner to return"
    end
end