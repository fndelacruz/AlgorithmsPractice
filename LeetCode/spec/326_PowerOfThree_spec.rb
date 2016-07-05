require "rspec"
require "326_PowerOfThree"

describe "#is_power_of_three(n)" do
  context "when given a number that is not a power of three" do
    it "returns false" do
      expect(is_power_of_three(4)).to eq(false)
    end
    it "returns false" do
      expect(is_power_of_three(2)).to eq(false)
    end
  end

  context "when given a number that is a power of three" do
    it "returns true" do
      expect(is_power_of_three(1)).to eq(true)
    end
    it "returns true" do
      expect(is_power_of_three(3)).to eq(true)
    end
    it "returns true" do
      expect(is_power_of_three(9)).to eq(true)
    end
    it "returns true" do
      expect(is_power_of_three(27)).to eq(true)
    end
  end
end
