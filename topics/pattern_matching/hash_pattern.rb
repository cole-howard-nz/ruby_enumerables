# No match
case {a: 'apple', b: 'banana', c: 'carrot'}
in {a: String, b: String, c: Integer}
  p :match
else
  p :no_match
end

# Hash magiks
case {a: 'apple', b: 'banana', c: 'carrot'}
in {a:, b:}
  p a,b
else
  p :no_match
end

# Splatt to group items you want to work with
case {a: 'apple', b: 'banana', c: 'carrot'}
in {a: 'apple', **rest}
  p rest
else
  p :no_match
end

# Be careful..
case {a: 'apple', b: 'banana', c: 'carrot'}
in {a: 'apple'}
  p 'will always hit'
in {a: 'apple', b: 'banana'}
  p 'will never reach'
end

# Fix it using nil!
case {a: 'apple', b: 'banana', c: 'carrot'}
in {a: 'apple', **nil}
  p 'nope'
in {a: 'apple', b: 'banana'}
  p :match
end

# SEEE SEEEEE
case {a: 'apple'}
in {a: 'apple', **nil}
  p :match
in {a: 'apple', b: 'banana'}
  p 'nope'
end

# Scoop up the hash using the as pattern
case {a: 'apple', b: 'banana', c: 'carrot'}
in {a: 'apple'} => hash
  p hash
end

login = {username: 'cole', password: 'SecretPassword321!'}
login => {username: username}
puts "Logged in under username: #{ username }"

data = [
  {name: 'James', age: 50, first_language: 'english', job_title: 'general manager'},
  {name: 'Jill', age: 32, first_language: 'italian', job_title: 'leet coder'},
  {name: 'Helen', age: 24, first_language: 'dutch', job_title: 'biscuit quality control'},
  {name: 'Bob', age: 64, first_language: 'english', job_title: 'table tennis king'},
  {name: 'Cole', age: 21, first_language: 'english', job_title: 'software engineer'},
  {name: 'Betty', age: 55, first_language: 'spanish', job_title: 'pie maker'},
]

name = 'Jill'
age = 32
job_title = 'leet coder'

case data
in [*, {name: ^name, age: ^age, first_language:, job_title: ^job_title}, *]
p first_language
end

case data
in [*, {name:, age:, first_language:, job_title: 'software engineer'}, *]
p name
end