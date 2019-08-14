##
# Service that generates random, arbitrarily nested arrays
#
class RandyArray
  # 1. Take an array of 1 through n
  #    Limit n to 10..100
  # 
  # 2. Randomly nest different items of the array
  # 
  # 3. Return result
  #
  def self.build
    new.call
  end

  def initialize
    @list = (1..10).to_a
    @nested = []
  end

  def call
    nested_array
  end

  private

  # def random_list
  #   (1..rand(10..100)).to_a
  # end

  def nested_array
    curr = @nested
    @list.each do |num|
      r = rand(3)
      if r == 1
        curr << num
      elsif r == 2
        curr << []
        curr = curr[curr.length - 1]
        curr << num
      else
        curr = @nested
        curr << num
      end
    end
    @nested
  end
end
