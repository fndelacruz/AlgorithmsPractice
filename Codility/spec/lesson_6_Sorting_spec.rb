require "rspec"
require "lesson_6_Sorting"

describe "#solution(a)" do
  it "returns number of distinct values in given array" do
    expect(solution([2, 1, 1, 2, 3, 1])).to eq(3)
  end

  it "returns number of distinct values in given array" do
    expect(solution([2, 1, 1, 2, 3, 1, 6])).to eq(4)
  end
  context "with empty array" do
    it "returns 0" do
      expect(solution([])).to eq(0)
    end
  end
end
