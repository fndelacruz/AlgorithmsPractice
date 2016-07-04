# Given an array of size n, find the majority element. The majority element is
# the element that appears more than ⌊ n/2 ⌋ times.
#
# You may assume that the array is non-empty and the majority element always
# exist in the array.
#
# @param {Integer[]} nums
# @return {Integer}
def majority_element(nums)
  threshold = nums.length / 2
  table = Hash.new { |h, k| h[k] = 0 }
  nums.each { |num| return num if (table[num] += 1) > threshold }
end
