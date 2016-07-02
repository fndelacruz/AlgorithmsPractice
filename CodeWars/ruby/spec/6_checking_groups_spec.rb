require "rspec"
require "6_checking_groups"

describe "#group_check" do
  context "when good symbol grouping" do
    it "returns true" do
      expect(group_check("{}([])")).to eq(true)
    end
    it "returns true" do
      expect(group_check("{[{}[]()[]{}{}{}{}{}{}()()()()()()()()]{{{[[[((()))]]]}}}}(())[[]]{{}}[][][][][][][]({[]})")).to eq(true)
    end
    it "returns true" do
      expect(group_check("")).to eq(true)
    end
  end

  context "when bad symbol grouping" do
    it "returns false" do
      expect(group_check("{(})")).to eq(false)
    end
    it "returns false" do
      expect(group_check("[{}{}())")).to eq(false)
    end
    it "returns false" do
      expect(group_check("[")).to eq(false)
    end
    it "returns false" do
      expect(group_check("}")).to eq(false)
    end
    it "returns false" do
      expect(group_check(")(")).to eq(false)
    end
  end
end
