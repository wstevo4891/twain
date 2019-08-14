# scripts/array_flattener_test.rb

require 'test/unit'
require_relative 'randy_array'
require_relative 'array_flattener'

# Test for ArrayFlattener service
class ArrayFlattenerTest < Test::Unit::TestCase
  # Setup
  # =========================
  # Generate a random, arbitrarily nested array of integers
  #
  def setup
    @arr = RandyArray.build
  end

  def teardown
    puts ''
  end

  def test_result_is_flat
    puts __method__
    result = ArrayFlattener.flatten(@arr)

    assert_false(result.find { |item| item.is_a? Array })
  end

  def test_result_has_all_numbers
    puts __method__
    result = ArrayFlattener.flatten(@arr)

    assert_equal result, (1..10).to_a
  end
end

# [1, 2, [3, [4, [5, 6]]], 7, 8, [9, [10]]]
