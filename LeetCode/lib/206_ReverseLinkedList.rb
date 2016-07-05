# require 'byebug'
# Reverse a singly linked list.
#
# Hint: A linked list can be reversed either iteratively or recursively. Could
# you implement both?
#
# Definition for singly-linked list.
class ListNode
  attr_accessor :val, :next
  def initialize(val)
    @val = val
    @next = nil
  end
end

# @param {ListNode} head
# @return {ListNode}
def reverse_list(head)
  return nil unless head
  nodes = collect_nodes(head)
  nodes.each_with_index do |node, idx|
    node.next = nodes[idx + 1]
  end
  nodes.first
end

def collect_nodes(head)
  nodes = []
  loop do
    nodes.unshift(head)
    if head.next
      head = head.next
    else
      break
    end
  end
  nodes
end
