# Could reuse the Person class created before and add methods, but I'm just writing again for more practice.
# - or, could create a Person module that gets mixed in with a JSONPerson or YAMLPerson. 

# - or, could repurpose the Person class to be a super class and create JSONPerson or YAMLPerson where they inherit the Person super class. 
#   (probably not useful for this case since there is no other methods except the to and from serialisation methods)

require 'json'

class Person
  attr_accessor :name, :age, :gender

  def initialize(name, age, gender)
    @name = name
    @age = age
    @gender = gender
  end

  def to_json
    JSON.dump({
      :name => self.name,
      :age => self.age,
      :gender => self.gender
    })
  end

  def self.from_json(json)
    json = JSON.load json
    self.new(
      json['name'],
      json['age'],
      json['gender']
    )
  end
end

p = Person.new('Cole', 22, 'Male')
pp p.to_json
p = Person.from_json(p.to_json)
pp p.name