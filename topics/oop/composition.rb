class Engine
    def start
        puts "Engine has been started"
    end
end

class Car
    def initialize
        @engine = Engine.new
    end

    def start
        @engine.start
    end
end

tezza = Car.new
tezza.start