# A string S consisting of N characters is considered to be properly nested if
# any of the following conditions is true:
#
# S is empty;
# S has the form "(U)" or "[U]" or "{U}" where U is a properly nested string;
# S has the form "VW" where V and W are properly nested strings.
# For example, the string "{[()()]}" is properly nested but "([)()]" is not.
#
# Write a function:
#
# def solution(s)
# that, given a string S consisting of N characters, returns 1 if S is properly
# nested and 0 otherwise.
#
# For example, given S = "{[()()]}", the function should return 1 and given
# S = "([)()]", the function should return 0, as explained above.
#
# Assume that:
#
# N is an integer within the range [0..200,000];
# string S consists only of the following characters: "(", "{", "[", "]", "}"
# and/or ")".
# Complexity:
#
# expected worst-case time complexity is O(N);
# expected worst-case space complexity is O(N) (not counting the storage
# required for input arguments).

require "Set"

def solution(a)
  stack = Stack.new
  openers = Set.new(["(", "{", "["])
  closers_to_openers = { ")" => "(", "}" => "{", "]" => "[" }

  a.each_char do |char|
    # if char is a closer, check if top element of stack matches current char
    if closers_to_openers[char]
      top_el = stack.peek
      closer = closers_to_openers[char]
      if top_el == closer
        stack.pop
      else
        return 0
      end
    # otherwise, char is an opener. just push char to top of stack
    else
      stack.push(char)
    end
  end

  stack.empty? ? 1 : 0
end

class Stack
  def initialize
    @store = []
  end

  def peek
    # returns nil if @store.empty?
    @store[-1]
  end

  def push(el)
    @store.push(el)
  end

  def pop
    @store.pop
  end

  def empty?
    @store.empty?
  end
end
