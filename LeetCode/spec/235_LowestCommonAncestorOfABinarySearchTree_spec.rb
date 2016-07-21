require "rspec"
require "235_LowestCommonAncestorOfABinarySearchTree"

describe "#lowest_common_ancestor(root, p, q)" do
  subject(:root_node) do
    root_node = TreeNode.new(6)
  end

  before do
    root_node.left = TreeNode.new(2)
    root_node.left.left = TreeNode.new(0)
    root_node.left.right = TreeNode.new(4)
    root_node.left.right.left = TreeNode.new(3)
    root_node.left.right.right = TreeNode.new(5)

    root_node.right = TreeNode.new(8)
    root_node.right.left = TreeNode.new(7)
    root_node.right.right = TreeNode.new(9)
  end

  it "returns the lowest common ancestor" #do
    # expect(lowest_common_ancestor).to
  # end
end
