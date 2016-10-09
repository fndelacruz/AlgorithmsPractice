require_relative "static_array"
require "byebug"
class RingBuffer
  attr_reader :length

  def initialize(size=8)
    @store = StaticArray.new(8)
    @length = 0
    @capacity = size
    @start_idx = 0
  end

  # O(1)
  def [](index)
    check_index(index)
    adjusted_idx = (@start_idx + index) % @capacity
    @store[adjusted_idx]
  end

  # O(1)
  def []=(index, val)
    check_index(index)
    adjusted_idx = (@start_idx + index) % @capacity
    @store[adjusted_idx] = val
  end

  # O(1)
  def pop
    check_index(0)
    last_idx = (length - 1 + @start_idx) % @capacity
    popped = @store[last_idx]
    @store[last_idx] = nil
    @length -= 1
    popped
  end

  # O(1) ammortized
  def push(val)
    resize! if @length == @capacity
    @length += 1
    self[@length - 1] = val
  end

  # O(1)
  def shift
    check_index(0)
    shifted = @store[@start_idx]
    @length -= 1
    @store[@start_idx] = nil
    @start_idx = (@start_idx + 1) % @capacity
    shifted
  end

  # O(1) ammortized
  def unshift(val)
    resize! if @length == @capacity
    @length += 1
    @start_idx = (@start_idx - 1) % @capacity
    @store[@start_idx] = val
  end

  protected
  attr_accessor :capacity, :start_idx, :store
  attr_writer :length

  def check_index(index)
    raise "index out of bounds" unless (0...@length).include?(index)
  end

  def resize!
    new_store = StaticArray.new(@capacity * 2)
    (0...@length).each { |idx| new_store[idx] = self[idx] }
    @capacity *= 2
    @store = new_store
    @start_idx = 0
  end
end
