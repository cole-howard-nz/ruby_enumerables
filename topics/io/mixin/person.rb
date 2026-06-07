require_relative 'basic_serialisable'

class Person
  include BasicSerialisable

  attr_accessor :name, :gender, :age, :parents

  def initialize(name, gender, age)
    @name = name
    @gender = gender
    @age = age
    @parents = []
  end

  def serialise
    object = JSON.parse super
    object['@parents'] = @parents.map do |parent|
      JSON.parse parent.serialise
    end

    SERIALISER.dump object
  end

  def unserialise(stream)
    object = SERIALISER.parse stream

    # AI Generated
    # need to come back to this and fully understand
    object.each do |key, value|
      if key == '@parents'
        instance_variable_set(key, value.map do |parent_hash|
          p = Person.new(nil, nil, nil)
          p.unserialise(parent_hash.to_json)
          p
        end)
      else
        instance_variable_set(key, value)
      end
    end

    self
    # End of AI Generated
  end
end

p = Person.new('Russell', 'Male', 65)
c = Person.new('Cole', 'Male', 22)

c.parents << p

# p c.serialise
c = c.unserialise(c.serialise)
p c.gender
c.parents.each { |parent| p parent.name }
# pp c
# serialised = c.serialise
# pp serialised
# pp c.unserialise serialised
# pp c.parent
# pp p.name