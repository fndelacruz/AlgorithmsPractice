# Related to question Excel Sheet Column Title
#
# Given a column title as appear in an Excel sheet, return its corresponding
# column number.
#
# For example:
#
#     A -> 1
#     B -> 2
#     C -> 3
#     ...
#     Z -> 26
#     AA -> 27
#     AB -> 28
# @param {String} s
# @return {Integer}
def title_to_number(s)
  digits = s.split('')
  column_number = 0
  digits.each_with_index do |digit, idx|
    power = digits.length - 1 - idx
    column_number += 26**power * digit_val(digit)
  end
  column_number
end

def digit_val(s)
  s.ord - 'A'.ord + 1
end
