require "rspec"
require "350_IntersectionOfTwoArraysII"

describe "intersect" do
  context "when given two arrays" do
    it "returns the intersection between them" do
      expect(intersect([1, 2, 2, 1], [2, 2])).to eq([2, 2])
    end

    it "returns the intersection between them" do
      expect(intersect([], [1, 3])).to eq([])
    end

    it "returns the intersection between them" do
      expect(intersect([], [])).to eq([])
    end
  end
end
