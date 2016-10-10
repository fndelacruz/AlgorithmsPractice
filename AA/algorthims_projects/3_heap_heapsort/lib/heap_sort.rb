require_relative "heap"

class Array
  def heap_sort!
    descending_proc = Proc.new { |el1, el2| el2 <=> el1 }

    # heapify array into a MAX HEAP for easy ASCENDING SORT
    first_parent_node_idx = BinaryMinHeap.parent_index(size - 1)
    first_parent_node_idx.downto(0).each do |idx|
      BinaryMinHeap.heapify_down(self, idx, size, &descending_proc)
    end

    (size - 1).times do |idx|
      # swap first unsorted element (next largest element) with last unsorted element.
      self[0], self[-1 - idx] = self[-1 - idx], self[0]
      # now, element at self[-1 - idx] is sorted

      # do not heapify on last swap (array is now sorted!)
      break if idx == size - 2

      # heapify down the first unsorted element
      BinaryMinHeap.heapify_down(self, 0, size - 1 - idx, &descending_proc)
    end
    self
  end
end
