require 'yaml'

class Person
  attr_accessor :name, :age, :gender

  def initialize(name, age, gender)
    @name = name
    @age = age
    @gender = gender
  end

  def to_yaml
    YAML.dump({
      name: self.name,
      age: self.age,
      gender: self.gender
    })
  end

  def self.from_yaml(yaml)
    yaml = YAML.load yaml
    self.new(yaml[:name], yaml[:age], yaml[:gender])
  end
end

p = Person.new 'Cole', 22, 'Male'
p p.to_yaml

p = Person.from_yaml(p.to_yaml)
p p
p p.name