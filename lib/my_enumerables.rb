module Enumerable
  # Your code goes here
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
my_each_results = []

array.my_each do |element|
  my_each_results << element * 2
end

p my_each_results