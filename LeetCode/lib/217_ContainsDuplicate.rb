# Given an array of integers, find if the array contains any duplicates. Your
# function should return true if any value appears at least twice in the array,
# and it should return false if every element is distinct.
# @param {Integer[]} nums
# @return {Boolean}
def contains_duplicate(nums)
  table = {}
  nums.each do |num|
    return true if table[num]
    table[num] = true
  end
  false
end
