require "byebug"
# We draw N discs on a plane. The discs are numbered from 0 to N − 1. A
# zero-indexed array A of N non-negative integers, specifying the radiuses of
# the discs, is given. The J-th disc is drawn with its center at (J, 0) and
# radius A[J].
#
# We say that the J-th disc and K-th disc intersect if J ≠ K and the J-th and
# K-th discs have at least one common point (assuming that the discs contain
# their borders).
#
# The figure below shows discs drawn for N = 6 and A as follows:
#
#   A[0] = 1
#   A[1] = 5
#   A[2] = 2
#   A[3] = 1
#   A[4] = 4
#   A[5] = 0
#
#
# There are eleven (unordered) pairs of discs that intersect, namely:
#
# discs 1 and 4 intersect, and both intersect with all the other discs;
# disc 2 also intersects with discs 0 and 3.
# Write a function:
#
# def solution(a)
#
# that, given an array A describing N discs as explained above, returns the
# number of (unordered) pairs of intersecting discs. The function should return
# −1 if the number of intersecting pairs exceeds 10,000,000.
#
# Given array A shown above, the function should return 11, as explained above.
#
# Assume that:
#
# N is an integer within the range [0..100,000];
# each element of array A is an integer within the range [0..2,147,483,647].
# Complexity:
#
# expected worst-case time complexity is O(N*log(N));
# expected worst-case space complexity is O(N), beyond input storage (not
# counting the storage required for input arguments).
# Elements of input arrays can be modified.
#
def solution(a)
  # intersection between two discs (j, k) occurs if the sum of their radii is
  # greater than or equal to the difference between the distance between their
  # centers: A[j] + A[k] >= k - j
  #
  # rearranging terms yields: A[j] + j >= k - A[k]
  #
  # can calculate both sides as arrays with same indices and sort them

  j_terms = a.map.with_index { |el, idx| el + idx }.sort
  k_terms = a.map.with_index { |el, idx| idx - el }.sort

  # if first k_term greater than first j_term, no intersection exists
  # return 0 if k_terms[0] > j_terms[0] #NOTE: might not be necessary since
  # counted terms are equal to k_idx...

  # in O(n + m) time, check which terms satisfy A[j] + j >= k - A[k]
  count = 0
  k_idx = 0
  j_terms.each do |j_term|
    until k_idx == k_terms.size || k_terms[k_idx] > j_term
      k_idx += 1
    end
    count += k_idx
  end

  # remove extra pairs (when j == k and duplicate combinations). this is just
  # the triangular number for the size of our array (see picture)
  #
  #   1 2 3 4
  # 1 x o o o
  # 2 x x o o
  # 3 x x x o
  # 4 x x x x

  length = a.size
  triangle_number = (length + 1) * length / 2

  debugger
  count - triangle_number
rescue => e
  debugger
end
