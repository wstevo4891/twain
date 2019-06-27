# test/services/array_flattener_test.rb

require 'test_helper'
require "#{Rails.root}/lib/services/randy_array"
require "#{Rails.root}/lib/services/array_flattener"

class ArrayFlattenerTest < ActiveSupport::TestCase
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

  test 'result is flat' do
    puts __method__
    result = ArrayFlattener.flatten(@arr)

    refute result.find { |item| item.is_a? Array }
  end

  test 'result has all numbers' do
    puts __method__
    result = ArrayFlattener.flatten(@arr)

    assert_equal result, (1..10).to_a
  end
end

# [1, 2, [3, [4, [5, 6]]], 7, 8, [9, [10]]]
