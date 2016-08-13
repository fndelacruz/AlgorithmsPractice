require "rspec"
require "lesson_4_MaxCounters"

describe "#solution(n, a)" do
  it "returns sequence of integers representing the counters" do
      expect(solution(5, [3, 4, 4, 6, 1, 4, 4])).to eq([3, 2, 2, 4, 2])
  end
end
