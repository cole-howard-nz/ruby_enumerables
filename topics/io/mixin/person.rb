require_relative 'basic_serialisable'

class Person
  include BasicSerialisable

  attr_accessor :name, :gender, :age

  def initialize(name, gender, age)
    @name = name
    @gender = gender
    @age = age
  end
end

p = Person.new('Cole', 'Male', 22)
pp p

serialised = p.serialise
pp serialised

p.unserialise serialised
pp p.unserialise serialised

pp p.class.name
pp p.name