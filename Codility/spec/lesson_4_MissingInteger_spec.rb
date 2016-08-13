require "rspec"
require "lesson_4_MissingInteger"

describe "#solution(a)" do
  it "should return the minimal positive integer that does not occur" do
    expect(solution([1, 3, 6, 4, 1, 2])).to eq(5)
  end
  context "with large min and max" do
    it "should return the minimal positive integer that does not occur" do
      expect(solution([-2147483648, 2147483647])).to eq(1)
    end
  end
end
