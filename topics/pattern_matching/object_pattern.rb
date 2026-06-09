
# Essentially this is doing
# Interger === input
# and
# String === input

# Triple equals with an object as the value on the left is checking
# if the types are the same, so String === 'some string' is true
# So Array === ['a', 'b', 'c'] is also true

def object_pattern input
  case input
    in Integer then puts 'I am an integer'
    in String then puts 'I am a string'
  end
end


object_pattern 3
object_pattern '3'