require "rspec"
require "231_PowerOfTwo"

describe "#is_power_of_two(n)" do
  context "when given an integer that is not a power of two" do
    it "returns false" do
      expect(is_power_of_two(3)).to eq(false)
    end
    it "returns false" do
      expect(is_power_of_two(10)).to eq(false)
    end
  end

  context "when given an integer that is a power of two" do
    it "returns true" do
      expect(is_power_of_two(1)).to eq(true)
    end
    it "returns true" do
      expect(is_power_of_two(2)).to eq(true)
    end
    it "returns true" do
      expect(is_power_of_two(4)).to eq(true)
    end
    it "returns true" do
      expect(is_power_of_two(8)).to eq(true)
    end
    it "returns true" do
      expect(is_power_of_two(512)).to eq(true)
    end
  end
end
