require "rspec"
require "lesson_3_PermMissingElem"

describe "#solution(a)" do
  context "when N == 0" do
    it "returns 1" do
      expect(solution([])).to eq(1)
    end
  end

  context "when N == 1" do
    context "when a == [1]" do
      it "returns 2" do
        expect(solution([1])).to eq(2)
      end
    end

    context "when a == [2]" do
      it "returns 1" do
        expect(solution([2])).to eq(1)
      end
    end
  end

  context "when N == 4" do
    context "when given example case" do
      it "returns the missing element" do
        expect(solution([2, 3, 1, 5])).to eq(4)
      end
    end

    context "when missing element is first number" do
      it "returns the missing element" do
        expect(solution([5, 3, 4, 2])).to eq(1)
      end
    end

    context "when missing element is last number" do
      it "returns the missing element" do
        expect(solution([5, 3, 4, 2])).to eq(1)
      end
    end
  end
end
