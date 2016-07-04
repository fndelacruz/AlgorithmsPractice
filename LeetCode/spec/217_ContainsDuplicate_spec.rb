require "rspec"
require "217_ContainsDuplicate"

describe "#contains_duplicate" do
  context "when an array has a duplicate" do
    it "returns true" do
      expect(contains_duplicate([0,0])).to eq(true)
    end
    it "returns true" do
      expect(contains_duplicate([1,2,1])).to eq(true)
    end
  end

  context "when an array elements are unique" do
    it "returns false" do
      expect(contains_duplicate([])).to eq(false)
    end
    it "returns false" do
      expect(contains_duplicate([1,4])).to eq(false)
    end
    it "returns false" do
      expect(contains_duplicate([0])).to eq(false)
    end
  end
end
