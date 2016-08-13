require "rspec"
require "lesson_4_PermCheck"

describe "#solution(a)" do
  context "when given an array with valid permutation" do
    it "returns 1" do
      expect(solution([4, 1, 3, 2])).to eq(1)
    end
  end

  context "when given an array without valid permutation" do
    it "returns 0" do
      expect(solution([4, 1, 3])).to eq(0)
    end
    context "with an antisum (proper sum but not a permutation)" do
      it "returns 0" do
        expect(solution([1, 2, 2, 5])).to eq(0)
      end

      it "returns 0" do
        expect(solution([1, 4, 1])).to eq(0)
      end
    end
  end
end
