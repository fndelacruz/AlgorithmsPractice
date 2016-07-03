# Given two arrays, write a function to compute their intersection.
#
# Example:
# Given nums1 = [1, 2, 2, 1], nums2 = [2, 2], return [2].
#
# Note:
# Each element in the result must be unique.
# The result can be in any order.
# @param {Integer[]} nums1
# @param {Integer[]} nums2
# @return {Integer[]}

def intersection1(nums1, nums2)
  if nums1.length > nums2.length
    shorter_arr, longer_arr = nums2, nums1
  else
    shorter_arr, longer_arr = nums1, nums2
  end
  shorter_arr.select { |el| longer_arr.include?(el) }.uniq
end
# 
# def intersection2(nums1, nums2)
#   if nums1.length > nums2.length
#     shorter_arr, longer_arr = nums2, nums1
#   else
#     shorter_arr, longer_arr = nums1, nums2
#   end
#   shorter_arr.inject([]) do |arr, el|
#     if longer_arr.include?(el) && !arr.include?(el)
#       arr.push(el)
#     else
#       arr
#     end
#   end
# end
#
# def intersection3(nums1, nums2)
#   intersection = {}
#   nums1_sorted = nums1.sort
#
#   nums2.each do |num|
#     intersection[num] = true if nums1_sorted.include?(num) && !intersection[num]
#   end
#
#   intersection.keys
# end
#
# def intersection4(nums1, nums2)
#   intersection = {}
#
#   nums2.each do |num|
#     intersection[num] = true if nums1.include?(num) && !intersection[num]
#   end
#
#   intersection.keys
# end
#
# require 'Benchmark'
#
# nums1 = ((1..10000).to_a.concat([0] * 20)).shuffle
#
# nums2 = ((1..10000).to_a.concat([0] * 20)).shuffle
#
# Benchmark.bmbm do |x|
#   x.report("intersection1") { intersection1(nums1, nums2) }
#   x.report("intersection2") { intersection2(nums1, nums2) }
#   x.report("intersection3") { intersection3(nums1, nums2) }
#   x.report("intersection4") { intersection4(nums1, nums2) }
# end
