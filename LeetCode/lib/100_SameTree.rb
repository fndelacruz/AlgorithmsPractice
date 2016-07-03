# Given two binary trees, write a function to check if they are equal or not.
#
# Two binary trees are considered equal if they are structurally identical and
# the nodes have the same value.
#
# Definition for a binary tree node.
class TreeNode
    attr_accessor :val, :left, :right
    def initialize(val)
        @val = val
        @left, @right = nil, nil
    end
end

# @param {TreeNode} p
# @param {TreeNode} q
# @return {Boolean}
# def is_same_tree(p, q)
#   if !p && !q
#     return true
#   elsif !p || !q
#     return false
#   end
#
#   if p.left && p.right && q.left && q.right
#     [p.val, p.left.val, p.right.val] == [q.val, q.left.val, q.right.val] &&
#         is_same_tree(p.left, q.left) &&
#         is_same_tree(p.right, q.right)
#   elsif p.left && q.left
#     [p.val, p.left.val] == [q.val, q.left.val] &&
#         is_same_tree(p.left, q.left)
#   elsif p.right && q.right
#     [p.val, p.right.val] == [q.val, q.right.val] &&
#         is_same_tree(p.right, q.right)
#   elsif !p.left && !p.right && !q.left && !q.right
#     p.val == q.val
#   else
#     false
#   end
# end


def is_same_tree(p, q)
  
end
