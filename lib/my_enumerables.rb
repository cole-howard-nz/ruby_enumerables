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
end

class Array
  def my_each
    return to_enum(:my_each) unless block_given?

    for element in self
      yield element 
    end
  end
end


