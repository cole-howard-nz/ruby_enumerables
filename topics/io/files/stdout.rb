$stdout = File.open('test.txt', 'a') 
puts 'AMD'
puts 'NVIDIA'
$stdout.close

$stdout = STDOUT
puts 'Intel'
