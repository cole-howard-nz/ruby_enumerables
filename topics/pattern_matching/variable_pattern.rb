
# This one sets the in variable, a in this case, to whatever the case
# variable is, input in our case.
# So a is always equal to input

def variable_pattern input
  case input
  in a 
    puts a
  end
end

variable_pattern 5


# This one uses the caret symbol to use a pre exising variable as the
# in variable, in this case a (123)

# :no_match is a pre defined symbol to throw the NoMatchingPatternError

def variable_pattern_two input
  a = 123

  begin
    case input
    in ^a
      :no_match
    end
  rescue NoMatchingPatternError => e
    puts e
  end
end

variable_pattern_two 3
