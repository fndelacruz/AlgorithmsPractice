# Given a binary tree, find its maximum depth.
#
# The maximum depth is the number of nodes along the longest path from the root
# node down to the farthest leaf node.
#
# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

# @param {TreeNode} root
# @return {Integer}
def max_depth(root)
  return 0 unless root

  [root.left, root.right].map do |child|
    child ? 1 + max_depth(child) : 1
  end.max
end
