proc_one = Proc.new { puts 'Hello, world! '}
proc_one.call

proc_two = proc { puts 'Hello, world! '}
proc_two.call

# With procs you can ignore arguments and they will be set as nil, extras will be ignored
a_proc = Proc.new { |name, age| puts "Hello #{ name }, you are #{ age } years old" }
a_proc.call('Cole', 21)
a_proc.call('Cole')
a_proc.call('Cole', 21, 'cole@cole.cole')

# With lambdas you have to pass all arguments required, or else an ArgumentError is raised
a_lambda = ->(name, age) { puts "Hello #{ name }, you are #{ age } years old" }
begin
  a_lambda.call('Cole')
rescue ArgumentError => e
  puts e
end

nested_array = [[1,2], [3,4], [5,6], [7,8]]
p nested_array.select { |a, b| a + b > 10 }

# Just found if you use a do block instead of a regular block the value returned 
# is the Enumerator for a select method instead of the actual values we selected
p nested_array.select do |a, b| a + b > 10 end


#  Procs will return to the 'embracing method' so we call test_one,
#  the proc is called within test_one and we return to where we called test_one
def test_one
  puts 'in test_one'

  proc = Proc.new { return 1 }
  proc.call

  puts 'in test_one after test_two'
end
test_one

# Lambdas on the other hand will return to where they were called.
# So we call test_two, the lambda is called and we return to where the 
# lambda is called, instead of the embracing method which would be the 
# root method where test_two is called
def test_two
  puts 'in test_one'

  lambda = ->{ return 1 }
  lambda.call

  puts 'in test_one after the lambda call'
end
test_two

# A more complex example to help with understanding procs

def test_three
  proc = Proc.new { return }
  puts 'in test_three'

  test_four(proc)

  puts 'in test_three after test_four call'

end
def test_four(proc)
  proc.call
  puts 'in test_four'
end
test_three

# and to showcase the ampersand & symbol, how it converts to a proc using to_proc

def test_five
  proc = Proc.new { return }
  lambda = ->{ return }

  test_six(&lambda)
  puts 'from within test_five'
  test_six(&proc)
  puts 'after from within test_five'
end
def test_six(block=nil)
  yield if block_given? 
  block.call if block
  puts 'from within test_six'
end
test_five

# test = Proc.new { return }
# test.call
# puts "test will end execution of the entire file so this won't be called"

def cool_block(&block_parameter)
  block_parameter.call
  puts 'World, hello!'
end

# Prints the lambdas contents and the methods contents since a lambda returns to
# the calling method, aka within cool_block at block_parameter.call
test = -> do 
  puts 'Hello, world!'
  return 
end
cool_block(&test)

# Prints only what is in the proc since the proc will return to embracing method
test = Proc.new do 
  puts 'Hello, world!'
  return 
end
cool_block(&test)