# Given an integer, write a function to determine if it is a power of two.
# @param {Integer} n
# @return {Boolean}
def is_power_of_two(n)
  num = n
  while n > 0
    return true if num == 1
    return false unless num % 2 == 0
    num /= 2
  end
  false
end
