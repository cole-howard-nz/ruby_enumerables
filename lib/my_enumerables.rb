module Enumerable
  def my_each_with_index
    # Allows method chaining unless there is a block to work on
    return to_enum(:my_each_with_index) unless block_given?

    index = 0
    my_each do |element|
      yield element, index
      index += 1
    end
  end

  def my_select
    return to_enum(:my_select) unless block_given?

    collection = []
    my_each { |element| collection.push(element) if yield element }

    collection
  end

  def my_all?
    return to_enum(:my_all?) unless block_given?

    passed = false
    my_each do |element| 
      passed = yield element
      return false unless passed
    end
    
    true
  end

  def my_any?
    return to_enum(:my_any?) unless block_given?

    my_each { |element| return true if yield element }

    false
  end

  def my_none?
    return to_enum(:my_none?) unless block_given?

    !my_any? { |element| return false if yield element }
  end

  def my_count
    return self.count unless block_given?

    count = 0
    my_each { |element| count += 1 if yield element }

    count
  end

  def my_map
    return to_enum(:my_map) unless block_given?

    map = []
    my_each { |element| map.append(yield element) }

    map
  end

  def my_inject(starting_value=0)
    return to_enum(:to_inject) unless block_given?

    count = starting_value
    for accumlator, element in self
      count += yield accumlator, element
    end

    count
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