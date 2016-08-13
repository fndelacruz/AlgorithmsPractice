# Write a function:
#
# def solution(a, b, k)
#
# that, given three integers A, B and K, returns the number of integers within
# the range [A..B] that are divisible by K, i.e.:
#
# { i : A ≤ i ≤ B, i mod K = 0 }
#
# For example, for A = 6, B = 11 and K = 2, your function should return 3,
# because there are three numbers divisible by 2 within the range [6..11],
# namely 6, 8 and 10.
#
# Assume that:
#
# A and B are integers within the range [0..2,000,000,000];
# K is an integer within the range [1..2,000,000,000];
# A ≤ B.
#
# Complexity:
#w
# expected worst-case time complexity is O(1);
# expected worst-case space complexity is O(1).
def solution(a, b, k)
  # NOTE: brute force solution O(n)
  # (a..b).reduce(0) { |count, num| num % k == 0 ? count + 1 : count }

  a_mod = a % k
  b_mod = b % k
  left_bound = a_mod == 0 ? a : a + k - a_mod
  right_bound = b - b_mod
  return 0 if left_bound > right_bound # no integers divisible by K in (a..b)

  range = right_bound - left_bound

  # left_bound + number of steps to right_bound
  1 + range / k
end
