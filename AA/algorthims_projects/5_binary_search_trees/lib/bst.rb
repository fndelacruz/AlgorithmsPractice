require "byebug"
class BSTNode
  attr_accessor :left, :right
  attr_reader :value

  def initialize(value)
    @value = value
    @left = nil
    @right = nil
  end

  def childless?
    @left.nil? && @right.nil?
  end
end

class BinarySearchTree
  def initialize
    @root = nil
  end

  def insert(value)
    if @root.nil?
      @root = BSTNode.new(value)
    else
      BinarySearchTree.insert!(@root, value)
    end
  end

  def find(value)
    return nil if @root.nil?
    BinarySearchTree.find!(@root, value)
  end

  def inorder
    BinarySearchTree.inorder!(@root)
  end

  def postorder
    BinarySearchTree.postorder!(@root)
  end

  def preorder
    BinarySearchTree.preorder!(@root)
  end

  def height
    BinarySearchTree.height!(@root)
  end

  def min
    BinarySearchTree.min(@root)
  end

  def max
    BinarySearchTree.max(@root)
  end

  def delete(value)
    BinarySearchTree.delete!(@root, value)
  end

  def self.insert!(node, value)
    return BSTNode.new(value) if node.nil?

    # puts duplicate values in LEFT child
    if value <= node.value
      if node.left.nil?
        node.left = BSTNode.new(value)
        return node
      else
        insert!(node.left, value)
      end
    else
      if node.right.nil?
        node.right = BSTNode.new(value)
        return node
      else
        insert!(node.right, value)
      end
    end
  end

  def self.find!(node, value)
    return node if node.value == value

    # since we put duplicate values in LEFT child, check left for equal values
    if value <= node.value
      node.left.nil? ? nil : find!(node.left, value)
    else
      node.right.nil? ? nil : find!(node.right, value)
    end
  end

  def self.preorder!(node)
    return [] if node.nil?
    [node.value] + inorder!(node.left) + inorder!(node.right)
  end

  def self.inorder!(node, options={})
    options[:rev] ||= false
    return [] if node.nil?

    if options[:rev]
      inorder!(node.right, rev: true) + [node.value] + inorder!(node.left, rev: true)
    else
      inorder!(node.left) + [node.value] + inorder!(node.right)
    end
  end

  def self.postorder!(node)
    return [] if node.nil?
    prc = Proc.new { |el1, el2| el2 <=> el1 }
    left = inorder!(node.left, rev: true)
    middle = inorder!(node.right, rev: true)
    left + middle + [node.value]
  end

  def self.height!(node)
    return -1 if node.nil?

    if node.childless?
      0
    else
      [(1 + height!(node.left)), (1 + height!(node.right))].max
    end
  end

  def self.max(node)
    node.right.nil? ? node : max(node.right)
  end

  def self.min(node)
    node.left.nil? ? node : min(node.left)
  end

  def self.delete_min!(node)
    return nil if node.nil? || node.left.nil?

    # find parent of min node
    until node.left.nil?
      min_parent = node
      node = node.left
    end

    # assign parent.left = min.right (min now has no reference, so gets GC'd)
    min_parent.left = min_parent.left.right
  end

  def self.delete!(node, value)
    return nil if node.nil? || node.childless?

    # recursion to find parent of node with value
    if node.left && value <= node.value
      # if this node's left child has value to be deleted, set left child equal
      # to nil ("delete" node's left child)
      if node.left.value == value
        node.left = nil
      # otherwise, keep searching on left child
      else
        delete!(node.left, value)
      end
    elsif node.right
      # if this node's right child has value to be deleted, set right child equal
      # to nil ("delete" node's right child)
      if node.right.value == value
        node.right = nil
      # otherwise, keep searching on right child
      else
        delete!(node.right, value)
      end
    end
  end
end
