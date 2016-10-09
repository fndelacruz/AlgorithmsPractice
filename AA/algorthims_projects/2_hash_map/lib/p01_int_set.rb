class MaxIntSet
  def initialize(max)
    @store = Array.new(max, false)
  end

  def insert(num)
    validate!(num)
    @store[num] = true
  end

  def remove(num)
    validate!(num)
    @store[num] = false
  end

  def include?(num)
    validate!(num)
    @store[num]
  end

  private

  def is_valid?(num)
    num >= 0 && num < @store.length
  end

  def validate!(num)
    raise "Out of bounds" unless is_valid?(num)
  end
end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    self[num] << num unless include?(num)
  end

  def remove(num)
    self[num].delete(num)
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    @store[num % num_buckets]
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  # O(n) worst case
  def insert(num)
    return nil if include?(num)
    resize! if @count == @store.length
    @count += 1
    self[num] << num
  end

  # O(n) worst case
  def remove(num)
    return nil unless include?(num)
    @count -= 1
    self[num].delete(num)
  end

  # O(n) worst case
  def include?(num)
    self[num].include?(num)
  end

  private

  # O(1)
  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    @store[num % num_buckets]
  end

  def num_buckets
    @store.length
  end

  def resize!
    new_capacity = @store.length * 2
    new_store = Array.new(new_capacity) { Array.new }
    @store.each do |old_bucket|
      old_bucket.each { |el| new_store[el % new_capacity] << el }
    end

    @store = new_store
  end
end
