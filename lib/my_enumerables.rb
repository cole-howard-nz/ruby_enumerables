module Enumerable
  def my_each_with_index
    # Allows method chaining unless there is a block meaning
    return to_enum(:my_each_with_index) unless block_given?

    index = 0
    for element in self
      yield element, index
      index += 1
    end
  end
end

class Array
  def my_each
    return to_enum(:my_each) unless block_given?

    for element in self
      yield element 
    end
  end
end

[1,2,3,4,5].my_each { |element| puts element * 2 }
[1,2,3,4,5].my_each_with_index { |element, index| puts "#{ index } : #{ element }"}