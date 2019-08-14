# test\services\randy_array_test.rb

require 'test/unit'
require_relative 'randy_array'

puts 'RandyArrayTest ==============================='

# Test for RandyArray service: a random nested array generator
class RandyArrayTest < Test::Unit::TestCase
  def setup
    @randy = RandyArray.build
  end

  def teardown
    puts ''
  end

  def test_can_build_array
    puts __method__
    print @randy
    assert_kind_of Array, @randy
  end

  def test_array_is_nested
    puts __method__
    assert_true(@randy.find { |item| item.is_a? Array })
  end
end
