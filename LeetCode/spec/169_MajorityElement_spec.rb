require "rspec"
require "169_MajorityElement"

describe "#majority_element" do
  it "finds the majority element" do
    expect(majority_element([3])).to eq(3)
  end
  it "finds the majority element" do
    expect(majority_element([1,2,2,4,2,2,5,4,0,2,2])).to eq(2)
  end
  it "finds the majority element" do
    expect(majority_element([3,1,1])).to eq(1)
  end
end
