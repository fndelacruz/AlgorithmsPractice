require "rspec"
require "lesson_5_CountDiv"

describe "#solution(a, b, k)" do
  it "returns the number of integers in range (a..b) divisible by k" do
    expect(solution(6, 11, 2)).to eq(3)
  end
end
