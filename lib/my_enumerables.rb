module Enumerable
  # Your code goes here

  def my_each_with_index
    length.times { |i| yield self[i], i }
    self
  end

  def my_all?
    check = true
    length.times { |n| check = false unless yield self[n] }
    check
  end

  def my_any?
    check = false
    length.times { |n| check = true if yield self[n] }
    check
  end

  def my_none?
    check = true
    length.times { |n| check = false if yield self[n] }
    check
  end

  def my_count
    count = length
    if block_given?
      length.times { |n| count -= 1 unless yield self[n] }
    end
    count
  end

  def my_inject(initial_value = 0)
    sum = 0 + initial_value
    length.times { |n| sum = yield sum, self[n] }
    sum
  end

  def my_map
    array = []
    length.times { |n| array << yield(self[n]) }
    array
  end

  def my_select
    array = []
    my_each { |object| array << object if yield object }
    array
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here

  def my_each
    length.times { |i| yield self[i] }
    self
  end
end

array = [1, 1, 2, 3, 5, 8, 13, 21, 34]
# my_each_results = []

# array.my_each do |element|
#  my_each_results << element * 2
# end

# p my_each_results

p(array.my_inject(100) { |sum, value| sum + value })

p(array.my_map { |value| value * 2 })
