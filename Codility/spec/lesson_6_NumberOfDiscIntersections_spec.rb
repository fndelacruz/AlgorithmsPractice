require "rspec"
require "lesson_6_NumberOfDiscIntersections"

describe "#solution(a)" do
  context "when number of intersecting pairs is <= 10_000_000" do
    context "when number of intersectin pairs is == 0" do
      it "returns 0" do
        expect(solution([0, 0, 0, 0, 0, 0])).to eq(0)
      end
    end
    it "returns number of intersecting pairs" do
      expect(solution([1, 5, 2, 1, 4, 0])).to eq(11)
    end
  end
end
