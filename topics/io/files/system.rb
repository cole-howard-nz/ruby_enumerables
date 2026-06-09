system 'ls'

out = `pwd`
puts out

out = %x[uptime]
puts out

f = open '|ls -l|head -3'
out = f.read
puts out
f.close

puts $?.success?