lambda_one = lambda { puts 'Hello, world!' }
lambda_two = -> { puts 'Hello, world, again!' }
lambda_one.call
lambda_two.call

my_name_one = lambda { |name| puts "Your name is #{ name }" }
my_name_two = ->(name) { puts "Your name is still #{ name }" }
my_name_one.call('Cole')
my_name_two.call('Cole')

# Weird ways to call lambdas
my_name_one['Cole']
my_name_one.('Cole')
my_name_one.=== 'Cole'