require_relative 'my_enumerables'

{a: 1, b: 2, c: 3, d: 4, e: 5}.my_each_with_index { |key, value| puts "#{ key } => #{ value }"}