require_relative "static_array"

class DynamicArray
  attr_reader :length

  def initialize(size=8)
    @store = StaticArray.new(size)
    @length = 0
    @capacity = size
  end

  # O(1)
  def [](index)
    check_index(index)
    @store[index]
  end

  # O(1)
  def []=(index, value)
    check_index(index)
    @store[index] = value
  end

  # O(1)
  def pop
    check_index(0)
    popped = @store[@length -= 1]
    @store[@length] = nil
    popped
  end

  # O(1) ammortized; O(n) worst case. Variable because of the possible
  # resize.
  def push(val)
    @length += 1
    resize! if @length > @capacity
    @store[@length - 1] = val
    @store
  end

  # O(n): has to shift over all the elements.
  def shift
    check_index(0)
    shifted = @store[0]
    (1...@length).each { |idx| @store[idx - 1] = @store[idx] }
    @length -= 1
    shifted
  end

  # O(n): has to shift over all the elements.
  def unshift(val)
    @length += 1
    resize! if @length > @capacity
    (@length - 1).downto(0).each { |idx| @store[idx + 1] = @store[idx] }
    @store[0] = val
  end

  protected
  attr_accessor :capacity, :store
  attr_writer :length

  def check_index(index)
    raise "index out of bounds" unless (0...@length).include?(index)
  end

  # O(n): has to copy over all the elements to the new store.
  def resize!
    new_store = StaticArray.new(@capacity * 2)
    (0...@capacity).each { |idx| new_store[idx] = @store[idx] }
    @capacity *= 2
    @store = new_store
  end
end
