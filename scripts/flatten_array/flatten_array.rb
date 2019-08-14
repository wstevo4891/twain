#!/bin/ruby

# Download this file:
# https://gist.github.com/wstevo4891/43e80f4a92eb870f75cd36dad7956b8b/download

# Run it from your terminal with:
# ruby flatten_array.rb
# Twain: docker-compose run web rails runner scripts/flatten_array.rb
# (Just make sure you are in the right directory)

ENV['RAILS_ENV'] = 'test'
require 'test/unit'

##
# flatten_array()
#   Flatten a nested array of integers
#
#   @param arr [Array<Integer, Array>] an arbitrarily nested array of integers
#
#   @return [Array<Integer>]
#
def flatten_array(arr)
  arr.each_with_object([]) do |item, flat|
    if item.is_a? Integer
      flat << item
    else
      flatten_array(item).each do |num|
        flat << num
      end
    end
  end
end

##
# Test for flatten_array() method
#
class FlattenArrayTest < Test::Unit::TestCase
  def teardown
    puts ''
  end
  
  def test_array_of_four
    puts __method__
    arr = [[1,2,[3]],4]
    result = flatten_array(arr)
    assert_equal result, (1..4).to_a
  end
  
  def test_array_of_five
    puts __method__
    arr = [[1, [2, [3]]], 4, [5]]
    result = flatten_array(arr)
    assert_equal result, (1..5).to_a
  end
  
  def test_array_of_ten
    puts __method__
    arr = [1, 2, [3, [4, [5, 6]]], 7, 8, [9, [10]]]
    result = flatten_array(arr)
    assert_equal result, (1..10).to_a
  end
  
  def test_array_of_fifteen
    puts __method__
    arr = [[1, [2, [3, [4, [5, [6]]]]]], 7, 8, 9, 10, 11, 12, [13], 14, 15]
    result = flatten_array(arr)
    assert_equal result, (1..15).to_a
  end
  
  def test_array_of_twenty
    puts __method__
    arr = [1, 2, 3, [4, 5], 6, 7, [8, 9, [10, [11, 12, [13, [14]]]]], 15, 16, [17, [18]], 19, [20]]
    result = flatten_array(arr)
    assert_equal result, (1..20).to_a
  end
end

puts 'We ran the script'

