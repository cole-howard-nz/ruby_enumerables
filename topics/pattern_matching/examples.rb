# puts Integer === 2
# puts 2 === Integer

# puts String === 'hello im a string'
# puts Array === ['hello', 'im', 'an', 'array', 'of', 'strings']



# The following case statements with 'when' and 'in' are equal to:
# String === input
# Integer === input

input = 3 
case input
  in String then puts 'I am a string'
  in Integer then puts 'I am an integer'
end

input = '3'
case input
when String then puts 'I am a string'
when Integer then puts 'I am an integer'
end