require "rspec"
require "lesson_3_FrogJmp"

describe "#solution(x, y, d)" do
  context "when x == y" do
    it "returns 0" do
      expect(solution(1, 1, 10)).to eq(0)
    end

    it "returns 0" do
      expect(solution(22, 22, 7)).to eq(0)
    end
  end

  context "when x < y" do
    it "returns minimal number of jumps" do
      expect(solution(10, 85, 30)).to eq(3)
    end

    it "returns minimal number of jumps" do
      expect(solution(10, 40, 30)).to eq(1)
    end

    context "when d < y - x" do
      it "returns minimal number of jumps" do
        expect(solution(1, 40, 1)).to eq(39)
      end
    end
  end
end
