# Given an integer, write a function to determine if it is a power of three.
# @param {Integer} n
# @return {Boolean}

# NOTE: iterative solution
def is_power_of_three(n)
  num = n
  while n > 0
    return true if num == 1
    num % 3 == 0 ? num /= 3 : break
  end
  false
end

# NOTE: recursive solution
# def is_power_of_three(n)
#   if n == 1 || n == 3
#     return true
#   elsif n == 0
#     return false
#   end
#
#   if n % 3 == 0
#     is_power_of_three(n / 3)
#   else
#     false
#   end
# end


# NOTE: this solution relies on Math::log and a defined epsilon
# def is_power_of_three(n)
#   epsilon = 10e-15
#   return false if n <= 0
#   factor = (Math.log(n) / Math.log(3))
#   (factor - factor.round).abs < epsilon
# end
