# $stdout.puts 'Hello, world!'
# Kernel.puts 'World, hello!'
# puts $stdin.gets
# puts Kernel.gets

# io = IO.new(1)
# io.puts 'Hello, world!'

# fd = IO.sysopen('/dev/null', 'w+')
# dev_null = IO.new(fd)

# dev_null.puts 'Into the void..'
# $stdout.puts 'Hello:', dev_null.gets

# dev_null.close

# IO.sysopen 'text.txt' # Returns 5
# txt = IO.new(5) # File descriptor for text.txt
# p txt.gets
# p txt.pos
# p txt.gets
# p txt.gets
# p txt.eof?
# txt.pos = 0
# txt.rewind   # Equal to setting pos = 0
# p txt.eof?
# p txt.gets
# p txt.gets
# p txt.gets
# p txt.gets # EOF, no error just nil returned
# txt.rewind
# p txt.gets

fd = IO.sysopen 'text.txt', 'w+' # Returns 8
txt = IO.new(fd)
txt.puts 'New line!'
p txt.eof?
txt.rewind
p txt.gets
txt.rewind
p txt.read