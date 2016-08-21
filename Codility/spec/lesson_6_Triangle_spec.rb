require "rspec"
require "lesson_6_Triangle"

describe "#solution(a)" do
  context "when trianglular triplet is present" do
    it "returns 1" do
      expect(solution([10, 2, 5, 1, 8, 10])).to eq(1)
    end
  end

  context "when trianglular triplet is absent" do
    it "returns 0" do
      expect(solution([10, 50, 5, 1])).to eq(0)
    end
  end
end
