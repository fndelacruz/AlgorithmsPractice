# Write a function that takes an unsigned integer and returns the number of ’1'
# bits it has (also known as the Hamming weight).
#
# For example, the 32-bit integer ’11' has binary representation
# 00000000000000000000000000001011, so the function should return 3.
#
# @param {Integer} n, a positive integer
# @return {Integer}
def hamming_weight(n)
  num = n
  count = 0

  until num == 0
    count += 1 if num % 2 == 1
    num /= 2
  end
  count
end
