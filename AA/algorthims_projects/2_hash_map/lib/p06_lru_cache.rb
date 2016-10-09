require_relative 'p05_hash_map'
require_relative 'p04_linked_list'

class LRUCache
  attr_reader :count
  def initialize(max, prc)
    @map = HashMap.new
    @store = LinkedList.new
    @max = max
    @prc = prc
  end

  def count
    @map.count
  end

  def get(key)
    if @map.include?(key)
      update_link!(@map[key])
    else
      calc!(key)
    end

    @map[key].val
  end

  def to_s
    "Map: " + @map.to_s + "\n" + "Store: " + @store.to_s
  end

  private

  def calc!(key)
    # suggested helper method; insert an (un-cached) key
    val = @prc.call(key)
    eject! if count == @max
    new_link = @store.insert(key, val)
    @map[key] = new_link
  end

  def update_link!(link)
    # suggested helper method; move a link to the end of the list

    # connect prev and next links
    link.prev.next = link.next
    link.next.prev = link.prev

    # move link to TAIL end of list
    old_last_link = @store.last
    tail = old_last_link.next

    old_last_link.next = link
    link.prev = old_last_link
    link.next = tail
    tail.prev = link
  end

  def eject!
    # remove link pointed by the HEAD
    oldest_link = @store.first

    # connect prev and next links
    oldest_link.prev.next = oldest_link.next
    oldest_link.next.prev = oldest_link.prev

    # remove key to this oldest_link from the map
    @map.delete(oldest_link.key)
  end
end
