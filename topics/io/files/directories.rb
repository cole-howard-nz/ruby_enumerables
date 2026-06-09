begin
  Dir.mkdir 'tmp'
rescue Errno::EEXIST
  puts 'Error: Directory already exists'
end

puts Dir.exist? 'tmp'
puts Dir.pwd
Dir.chdir '..'
puts Dir.pwd
Dir.chdir './files'
Dir.rmdir 'tmp'
puts Dir.exist? 'tmp'

puts '---'
files = Dir.entries '../'
# puts files.inspect is equal to 'p files'
p files
puts '---'

puts Dir.home
puts Dir.home 'cole'
puts Dir.home 'root'