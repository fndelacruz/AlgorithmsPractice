require_relative 'p02_hashing'
require_relative 'p04_linked_list'

class HashMap
  include Enumerable

  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { LinkedList.new }
    @count = 0
  end

  def include?(key)
    bucket(key).include?(key)
  end

  def set(key, val)
    if include?(key)
      bucket(key).find { |node| node.key == key }.val = val
    else
      resize! if @count == num_buckets
      @count += 1
      bucket(key).insert(key, val)
    end
  end

  def get(key)
    bucket(key).get(key)
  end

  def delete(key)
    if include?(key)
      bucket(key).remove(key)
      @count -= 1
    end
  end

  def each
    @store.each do |bucket|
      bucket.each do |link|
        yield link.key, link.val
      end
    end
  end

  # uncomment when you have Enumerable included
  def to_s
    pairs = inject([]) do |strs, (k, v)|
      strs << "#{k.to_s} => #{v.to_s}"
    end
    "{\n" + pairs.join(",\n") + "\n}"
  end

  alias_method :[], :get
  alias_method :[]=, :set

  private

  def num_buckets
    @store.length
  end

  def resize!
    new_capacity = @store.length * 2
    new_store = Array.new(new_capacity) { LinkedList.new }
    each do |key, val|
      bucket = new_store[key.hash % new_capacity]
      bucket.insert(key, val)
    end
    @store = new_store
  end

  def bucket(key)
    # optional but useful; return the bucket corresponding to `key`
    @store[key.hash % num_buckets]
  end
end
