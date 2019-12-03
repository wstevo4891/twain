##
# Service that flattens a nested array of integers
#
class ArrayFlattener
  def self.flatten(arr)
    new(arr).call
  end

  def initialize(arr)
    @arr = arr
  end

  def call
    flatten_array(@arr)
  end

  private

  def flatten_array(arr)
    arr.each_with_object([]) do |item, flat|
      if item.is_a? Array
        flatten_array(item).each do |num|
          flat << num
        end
      else
        flat << item
      end
    end
  end
end
