require "byebug"
class QuickSort
  # Quick sort has average case time complexity O(nlogn), but worst
  # case O(n**2).

  # Not in-place. Uses O(n) memory.
  def self.sort1(array)
  end

  # In-place.
  def self.sort2!(array, start = 0, length = array.length, &prc)
    return if length < 2

    pivot = partition(array, start, length, &prc)
    # puts "sort2! pivot: #{pivot}"

    # sort left of partition
    left_length = pivot - start
    # puts "left- start: #{start}, length: #{left_length}"
    sort2!(array, start, left_length, &prc)

    # sort right of partition
    right_length = length - left_length - 1
    # puts "right- start: #{pivot + 1}, length: #{right_length}"
    sort2!(array, pivot + 1, right_length, &prc)

    array
  end

  def self.partition(array, start, length, &prc)
    prc ||= Proc.new { |el1, el2| el1 <=> el2 }

    # uncomment below to choose random pivot. otherwise, first element is pivot
    # NOTE: uncommenting will break #partition spec since it is no longer deterministic
    # random_pivot = rand(start...(start + length))
    # array[start], array[random_pivot] = array[random_pivot], array[start]

    next_pivot = start + 1

    ((start + 1)...(start + length)).each do |idx|
      # if current el is less than pivot el, swap current el and el at next_pivot
      if prc.call(array[idx], array[start]) == -1
        array[idx], array[next_pivot] = array[next_pivot], array[idx]
        next_pivot += 1
      end

      # Note that this guarantees the earliest element greater than or equal to
      # the pivot element (array[start]) is at pivot idx. This means that this
      # is the idx to swap with an element less than the pivot element, if we
      # want to keep lesser elements on the left (which we do!).
    end

    # finally, swap pivot el with most recently swapped lesser element
    pivot = next_pivot - 1
    array[start], array[pivot] = array[pivot], array[start]

    pivot
  end
end
