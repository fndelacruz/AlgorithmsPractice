require "rspec"
require "lesson_6_MaxProductOfThree"

describe "#solution(a)" do
  it "returns the maximum triplet product" do
    expect(solution([-3, 1, 2, -2, 5, 6])).to eq(60)
  end

  it "returns the maximum triplet product" do
    expect(solution([-5, 5, -5, 4])).to eq(125)
  end

  context "handles zeroes" do
    it "returns maximum triplet product" do
      expect(solution([-6, -5, 0, 5, 6])).to eq(180)
    end

    context "when zero must be included" do
      it "returns 0" do
        expect(solution([0, 1000, 4000]))
      end
    end

    context "when zero is the solution" do
      it "returns maximum triplet product" do
        expect(solution([-2, -3, -5, -6, 0])).to eq(0)
      end
    end
  end
end
