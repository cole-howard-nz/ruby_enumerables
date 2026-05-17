class Passenger
end

class Car
    def initialize(passengers)
        @passengers = passengers
    end
end

tezza = Car.new [Passenger.new, Passenger.new]