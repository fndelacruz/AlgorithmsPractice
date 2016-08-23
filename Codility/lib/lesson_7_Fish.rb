require "byebug"
# You are given two non-empty zero-indexed arrays A and B consisting of N
# integers. Arrays A and B represent N voracious fish in a river, ordered
# downstream along the flow of the river.
#
# The fish are numbered from 0 to N − 1. If P and Q are two fish and P < Q,
# then fish P is initially upstream of fish Q. Initially, each fish has a
# unique position.
#
# Fish number P is represented by A[P] and B[P]. Array A contains the sizes of
# the fish. All its elements are unique. Array B contains the directions of the
# fish. It contains only 0s and/or 1s, where:
#
# 0 represents a fish flowing upstream,
# 1 represents a fish flowing downstream.
# If two fish move in opposite directions and there are no other (living) fish
# between them, they will eventually meet each other. Then only one fish can
# stay alive − the larger fish eats the smaller one. More precisely, we say
# that two fish P and Q meet each other when P < Q, B[P] = 1 and B[Q] = 0, and
# there are no living fish between them. After they meet:
#
# If A[P] > A[Q] then P eats Q, and P will still be flowing downstream,
# If A[Q] > A[P] then Q eats P, and Q will still be flowing upstream.
# We assume that all the fish are flowing at the same speed. That is, fish
# moving in the same direction never meet. The goal is to calculate the number
# of fish that will stay alive.
#
# For example, consider arrays A and B such that:
#
#   A[0] = 4    B[0] = 0
#   A[1] = 3    B[1] = 1
#   A[2] = 2    B[2] = 0
#   A[3] = 1    B[3] = 0
#   A[4] = 5    B[4] = 0

# Initially all the fish are alive and all except fish number 1 are moving
# upstream. Fish number 1 meets fish number 2 and eats it, then it meets fish
# number 3 and eats it too. Finally, it meets fish number 4 and is eaten by it.
# The remaining two fish, number 0 and 4, never meet and therefore stay alive.
#
# Write a function:
#
# def solution(a, b)
#
# that, given two non-empty zero-indexed arrays A and B consisting of N
# integers, returns the number of fish that will stay alive.
#
# For example, given the arrays shown above, the function should return 2, as
# explained above.
#
# Assume that:
#
# N is an integer within the range [1..100,000];
# each element of array A is an integer within the range [0..1,000,000,000];
# each element of array B is an integer that can have one of the following
# values: 0, 1;
# the elements of A are all distinct.
# Complexity:
#
# expected worst-case time complexity is O(N);
# expected worst-case space complexity is O(N), beyond input storage (not
# counting the storage required for input arguments).
# Elements of input arrays can be modified.
#
def solution(a, b)
  # separate fish into upstream (0) queue and downstream (1) stack
  upstream = Queue.new
  downstream = Queue.new
  b.each_with_index do |stream, idx|
    fish_size = a[idx]
    fish = {size: fish_size, pos: idx}
    if stream == 0
      upstream.enqueue(fish)
    else
      downstream.enqueue(fish)
    end
  end

  # process queues until one is empty
  escaped_fish = 0
  until upstream.empty? || downstream.empty?
    u_fish = upstream.front
    d_fish = downstream.front
    if u_fish[:pos] < d_fish[:pos]
      # fish escapes regardless of d_fish size since it is already past it
      upstream.dequeue
      escaped_fish += 1
    else
      # one fish eats the other. fish size are guaranteed to be unique, so fish
      # encounters always result in an elimination
      u_fish[:size] > d_fish[:size] ? downstream.dequeue : upstream.dequeue
    end
  end

  # return number of remaining fish
  escaped_fish + upstream.size + downstream.size
end

class Queue
  def initialize
    @store = []
  end

  def size
    @store.length
  end

  def enqueue(el)
    @store << el
  end

  def dequeue
    @store.shift
  end

  def front
    @store[0]
  end

  def back
    @store.last
  end

  def empty?
    size == 0
  end
end



def solution(a, b)
  # track a stack of survivors
  survivors = Stack.new

  # examine all fish in O(n + m) time starting from position 0 onwards
  until a.empty?
    next_fish = { size: a.shift, direction: b.shift }

    # immediately push first fish to survivors stack
    if survivors.empty?
      survivors.push(next_fish)
      next
    end

    # fish encounter only occurs if the top surviving fish swims downstream AND
    # next_fish swims upstream
    if survivors.top[:direction] == 1 && next_fish[:direction] == 0
      # handle fish fight
      loop do
        # if no more fish to fight, add next_fish to survivors
        if survivors.empty? || survivors.top[:direction] == 0
          survivors.push(next_fish)
          break

        # fish fight!
        else
          # if top survivor wins, next_fish gets garbage collected
          if survivors.top[:size] > next_fish[:size]
            break
          # if top survivor loses, repeat process again for next_fish
          else
            survivors.pop
          end
        end
      end

    # if no fish fight, add next_fish to survivors
    else
      survivors.push(next_fish)
    end
  end

  survivors.size
end

class Stack
  def initialize
    @store = []
  end

  def push(el)
    @store << el
  end

  def pop
    @store.pop
  end

  def top
    @store.last
  end

  def size
    @store.size
  end

  def empty?
    size == 0
  end
end
