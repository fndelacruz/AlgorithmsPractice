require_relative 'p02_hashing'
require 'byebug'

class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    unless include?(key)
      resize! if @count == num_buckets
      @count += 1
      self[key] << key
    end
  end

  def include?(key)
    self[key].include?(key)
  end

  def remove(key)
    if include?(key)
      @count -= 1
      self[key].delete(key)
    end
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    @store[num.hash % num_buckets]
  end

  def num_buckets
    @store.length
  end

  def resize!
    new_capacity = @store.length * 2
    new_store = Array.new(new_capacity) { Array.new }
    @store.each do |old_bucket|
      old_bucket.each { |el| new_store[el.hash % new_capacity] << el }
    end
    @store = new_store
  end
end
