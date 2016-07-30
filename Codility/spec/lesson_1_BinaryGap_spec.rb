require "lesson_1_BinaryGap"

describe "solution(n)" do
  context "when binary gap present" do
    it "returns largest binary gap" do
      expect(solution(9)).to eq(2)
    end

    it "returns largest binary gap" do
      expect(solution(529)).to eq(4)
    end

    it "returns largest binary gap" do
      expect(solution(20)).to eq(1)
    end

    it "returns largest binary gap" do
      expect(solution(1041)).to eq(5)
    end
  end

  context "when binary gap not present" do
    it "returns 0" do
      expect(solution(15)).to eq(0)
    end
  end
end
