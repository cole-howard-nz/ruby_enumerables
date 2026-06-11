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

  def my_select
    return to_enum(:my_select) unless block_given?

    collection = []
    for element in self
      collection.push(element) if yield element
    end

    collection
  end

  def my_all?
    return to_enum(:my_all?) unless block_given?

    passed = false
    for element in self
      passed = yield element
      return false unless passed
    end
    
    true
  end

  def my_any?
    return to_enum(:my_any?) unless block_given?

    for element in self
      return true if yield element
    end

    false
  end

  def my_none?
    return to_enum(:my_none?) unless block_given?

    passed = false
    for element in self
      passed = yield element
      return false if passed
    end

    true
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