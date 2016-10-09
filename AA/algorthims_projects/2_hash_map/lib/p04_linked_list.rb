class Link
  attr_accessor :key, :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end
end

class LinkedList
  include Enumerable

  def initialize
    @head = Link.new
    @tail = Link.new
    @head.next = @tail
    @tail.prev = @head
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    @head.next unless empty?
  end

  def last
    @tail.prev unless empty?
  end

  def empty?
    @head.next == @tail
  end

  def get(key)
    current_link = first
    until current_link == nil
      return current_link.val if current_link.key == key
      current_link = current_link.next
    end
  end

  def include?(key)
    current_link = first
    until current_link == nil
      return true if current_link.key == key
      current_link = current_link.next
    end
    false
  end

  def insert(key, val)
    link = Link.new(key, val)
    prev_node = @tail.prev

    prev_node.next = link
    link.prev = prev_node

    link.next = @tail
    @tail.prev = link
  end

  def remove(key)
    current_link = first
    until current_link == nil
      if current_link.key == key
        current_link.prev.next = current_link.next
        current_link.next.prev = current_link.prev
        return current_link.val
      end
      current_link = current_link.next
    end
  end

  def each
    return self if empty?
    current_link = first
    until current_link.next == nil
      yield current_link
      current_link = current_link.next
    end
    self
  end

  # uncomment when you have `each` working and `Enumerable` included
  def to_s
    inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  end
end
