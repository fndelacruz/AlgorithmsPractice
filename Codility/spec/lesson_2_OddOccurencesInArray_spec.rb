require "rspec"
require "lesson_2_OddOccurencesInArray"

describe "#solution(a)" do
  context "when given an array with 1 element" do
    it "returns the unpaired element" do
      expect(solution([4])).to eq(4)
    end
  end

  context "when given an array with > 1 element" do
    it "returns the unpaired element" do
      expect(solution([9, 3, 9, 3, 9, 7, 9])).to eq(7)
    end

    it "returns the unpaired element" do
      expect(solution([5, 2, 5])).to eq(2)
    end
  end
end
