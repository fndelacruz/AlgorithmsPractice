require "byebug"
require "rspec"
require "206_ReverseLinkedList"

describe ListNode do
  subject(:root_node) do
    root_node = ListNode.new(:a)
    root_node.next = ListNode.new(:b)
    root_node.next.next = ListNode.new(:c)
    root_node
  end

  let!(:a_node) { root_node }
  let!(:b_node) { root_node.next }
  let!(:c_node) { root_node.next.next }

  describe "#val" do
    it "returns the node's value" do
      expect(root_node.val).to eq(:a)
    end

    it "does not return some random value" do
      expect(root_node.val).to_not eq(:z)
    end
  end

  describe "#next" do
    context "when handling 1 transition deep" do
      it "returns the next node in the list" do
        expect(root_node.next.val).to eq(:b)
      end
    end

    context "when handling 2 transitions deep" do
      it "returns the next node in the list" do
        expect(root_node.next.next.val).to eq(:c)
      end
    end
  end

  describe "#reverse_list" do

    it "returns an instance of ListNode" do
      expect(reverse_list(root_node).class).to eq(ListNode)
    end

    it "returns the reversed linked list" do
      reverse_list(root_node)
      expect(c_node.next.val).to eq(:b)
      expect(b_node.next.val).to eq(:a)
      expect(a_node.next).to eq(nil)
    end

    context "when given an unlinked node" do
      let (:lonely_node) { ListNode.new(:a) }
      
      it "returns that node" do
        expect(reverse_list(lonely_node)).to eq(lonely_node)
      end
    end
  end
end
