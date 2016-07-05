# Given two arrays, write a function to compute their intersection.
# 
# Example: Given nums1 = [1, 2, 2, 1], nums2 = [2, 2], return [2, 2].
#
# Note: Each element in the result should appear as many times as it shows in
# both arrays. The result can be in any order.
#
# @param {Integer[]} nums1
# @param {Integer[]} nums2
# @return {Integer[]}
def intersect(nums1, nums2)
  table = [Hash.new(0), Hash.new(0)]
  [nums1, nums2].each_with_index do |nums, idx|
    nums.each do |num|
      table[idx][num] += 1
    end
  end

  intersection = []
  if nums1.size > nums2.size
    min_table, max_table = table[1], table[0]
  else
    min_table, max_table = table[0], table[1]
  end

  max_table.keys.each do |el|
    intersection += [el] * [min_table[el], max_table[el]].min
  end

  intersection
end
