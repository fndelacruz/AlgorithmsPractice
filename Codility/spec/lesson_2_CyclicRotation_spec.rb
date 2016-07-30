require "rspec"
require "lesson_2_CyclicRotation"

describe "#solution(a, k)" do
  context "handles empty array" do
    it "returns empty array" do
      expect(solution([], 4)).to eq([])
    end

    it "fail!" do
      fail
    end
  end
  context "handles k < a.length" do
    it "returns array a shifted to right by k indexes" do
      expect(solution([3, 8, 9, 7, 6], 0)).to eq([3, 8, 9, 7, 6])
    end

    it "returns array a shifted to right by k indexes" do
      expect(solution([3, 8, 9, 7, 6], 1)).to eq([6, 3, 8, 9, 7])
    end

    it "returns array a shifted to right by k indexes" do
      expect(solution([3, 8, 9, 7, 6], 3)).to eq([9, 7, 6, 3, 8])
    end
  end

  context "handles k >= a.length" do
    it "returns array a shifted to right by k indexes" do
      expect(solution([3, 8, 9, 7, 6], 5)).to eq([3, 8, 9, 7, 6])
    end

    it "returns array a shifted to right by k indexes" do
      expect(solution([3, 8, 9, 7, 6], 6)).to eq([6, 3, 8, 9, 7])
    end

    it "returns array a shifted to right by k indexes" do
      expect(solution([3, 8, 9, 7, 6], 7)).to eq([7, 6, 3, 8, 9])
    end
  end
end
