# test\services\randy_array_test.rb

require 'test_helper'
require "#{Rails.root}/lib/services/randy_array"

puts 'RandyArrayTest ==============================='

class RandyArrayTest < ActiveSupport::TestCase
  def setup
    @randy = RandyArray.build
  end

  def teardown
    puts ''
  end

  test 'can_build_array' do
    puts __method__
    print @randy
    assert_kind_of Array, @randy
  end

  test 'array_is_nested' do
    puts __method__
    assert @randy.find { |item| item.is_a? Array }
  end
end
