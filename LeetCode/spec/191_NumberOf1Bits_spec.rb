require "rspec"
require "191_NumberOf1Bits"

describe "#hamming_weight(n)" do
  context "when given an unsigned integer" do
    it "returns the number of 1 bits it has" do
      expect(hamming_weight(11)).to eq(3)
    end
  end
end
