def logger
  yield
end


logger do
  puts 'Hello, world!'
end

logger do
  users = {user: 'Cole', pass: 'Password123'}
  users => user:
  puts user
end


def duped_logger
  yield 
  yield
end

duped_logger { puts 'How many fingers am I holding up?' }


def logger_with_arguments
  yield({user: 'Cole', pass: 'Password123'})
end

logger_with_arguments do |user|
  puts 'Preparing to leak super confidential password:'
  user => pass:
  puts "--> #{ pass }"
end


def hash_method hash
  hash.each do |key, value|
    yield key, value
  end
end

hash = {user: 'Cole', pass: 'Password123'}
hash_method(hash) { |key,value| puts "The #{ key } has a value of #{ value }" }


# Will error if no block is passed
def simple_method 
  begin
    yield
  rescue LocalJumpError => e
    puts e
  end
end

def better_method
  if block_given?
    puts 'block given'
    yield
  else
    puts 'no block given'
  end
end

simple_method
better_method
better_method {}
better_method { puts 'Hello, world!' }
