/**
 * Definition for a binary tree node.
 * function TreeNode(val) {
 *     this.val = val;
 *     this.left = this.right = null;
 * }
 */
/**
 * @param {TreeNode} root
 * @return {number}
 */
var maxDepth = function(root) {
  if (!root) {
    return 0;
  }

  return Math.max.apply(null, [root.left, root.right].map(function(child) {
    return child ? 1 + maxDepth(child) : 1;
  }));
};
