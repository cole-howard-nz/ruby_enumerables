def one_two_three
  yield 1
  yield 2
  yield 3
end
one_two_three { |n| puts n * 10 }


def explicit_block(&block)
  block.call
  # yield is the same as block.call
end
explicit_block { puts 'Hello, world!' }


def do_something_with_block
  yield if block_given?
end
do_something_with_block { puts 'Uhh I did sumtin' }


lambda = ->{ puts 'The brother lambda' }
lambda.call

times_two = ->(x){ puts x * 2 }
times_two.call(5)

times_two = Proc.new { |x| puts x * 2 if x }
times_two.call
times_two.call(5)


def call_proc(proc)
count = 500
proc.call
end

count = 1
proc = Proc.new { puts count }
count = 67
call_proc proc


def my_binding
  var = 123
  binding
end

puts my_binding.eval 'var'