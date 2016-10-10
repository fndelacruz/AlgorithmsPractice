require "byebug"
class BinaryMinHeap
  DEFAULT_PROC = Proc.new { |el1, el2| el1 <=> el2 }

  def self.child_indices(len, parent_index)
    [2 * parent_index + 1, 2 * parent_index + 2].select { |idx| idx < len }
  end

  def self.parent_index(child_index)
    raise "root has no parent" if child_index.zero?
    (child_index - 1) / 2
  end

  def self.heapify_down(array, parent_idx, len = array.length, &prc)
    comparator = prc || DEFAULT_PROC
    idx = parent_idx
    while idx <= parent_index(len - 1)
      current_el = array[idx]

      # get idx of smallest (maximum) two children
      child_indices = child_indices(len, idx)

      # find child index of smaller element
      if child_indices.size == 2
        case comparator.call(*child_indices.map { |idx| array[idx] })
        when -1
          child_idx = child_indices.first
        when 1
          child_idx = child_indices.last
        when 0
          break
        end
      else
        child_idx = child_indices.first
      end

      # stop heapifying down if current el is less than or equal to its smallest child
      break unless comparator.call([current_el, array[child_idx]]) == 1

      # swap current el with its smallest child
      array[idx], array[child_idx] = array[child_idx], array[idx]

      # move down the heap
      idx = child_idx
    end
    array
  end

  def self.heapify_up(array, child_idx, len = array.length, &prc)
    idx = child_idx
    while idx > 0
      parent_idx = parent_index(idx)

      # stop heapifying up if current el is greater than its parent
      break if array[idx] > array[parent_idx]

      # swap current el with its parent
      array[idx], array[parent_idx] = array[parent_idx], array[idx]

      # move up the heap
      idx = parent_idx
    end
    array
  end

  def self.heapify_up(array, child_idx, len = array.length, &prc)
    proc = prc || DEFAULT_PROC
    idx = child_idx
    while idx > 0
      parent_idx = parent_index(idx)

      # stop heapifying up if current el is greater than its parent
      break if proc.call(array[idx], array[parent_idx]) == 1

      # swap current el with its parent
      array[idx], array[parent_idx] = array[parent_idx], array[idx]

      # move up the heap
      idx = parent_idx
    end
    array
  end

  def initialize(&prc)
    @prc = prc
    @store = []
  end

  def count
    store.size
  end

  def extract
    store[0], store[count - 1] = store[count - 1], store[0]
    extracted = store.pop
    self.class.heapify_down(store, 0, count, &prc)
    extracted
  end

  def peek
    store[0]
  end

  def push(val)
    store.push(val)
    self.class.heapify_up(store, count - 1, count, &prc)
  end

  protected
  attr_accessor :prc, :store
end
