# No match
case [1,2]
in [1,2,3]
  p :match
else
  p :no_match
end

# Match
case [1,2]
in [1,2, *]
  p :match
else
  p :no_match
end

# No match
case [3,'4',5]
in [Integer, String]
  p :match
else
  p :no_match
end

# Match
case [3,'4',5]
in [Integer, String, *]
  p :match
else
  p :no_match
end

# Match
case [3,'4',5]
in [Integer, *rest]
  p rest
else
  p :no_match
end

# Match
case [2,3,'4',5,'6',7]
in [*, String => first_occurrence, *]
  p first_occurrence
else
  p :no_match
end

# No match
case [1,2,3]
in [_, Integer]
  p :match
else
  p :no_match
end

# No match
case [1,1]
in [Integer => a, Integer => b] unless a == b
  p :match
else
  p :no_match
end

# Careful with reassignments..
array = [1,2,3]
case [1,2,4]
in array
  p :match
end

p array == [1,2,3]
p array