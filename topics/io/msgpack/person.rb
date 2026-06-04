require 'msgpack'
require 'json'

class Person
  attr_accessor :name, :gender, :age

  def initialize(name, gender, age)
    @name = name
    @gender = gender
    @age = age
  end

  def to_message_pack()
    MessagePack.dump({
      :name => name,
      :gender => gender,
      :age => age
    })
  end

  def self.from_message_pack(msgpack)
    msgpack = MessagePack.load msgpack
    self.new(
      msgpack['name'],
      msgpack['gender'],
      msgpack['age']
    )
  end
end

p = Person.new('Cole', 'Male', 22)
p p.to_message_pack
p = Person.from_message_pack(p.to_message_pack)
p p
p p.name