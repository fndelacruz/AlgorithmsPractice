require "rspec"
require "lesson_7_StoneWall"

describe "#solution(h)" do
  context "with given example" do
    let(:h) { [8, 8, 5, 7, 9, 8, 7, 4, 8] }
    it "returns 7" do
      expect(solution(h)).to eq(7)
    end
  end

  context "with several of same element" do
    let(:h) { [5,5,5,5,5] }
    it "returns 1" do
      expect(solution(h)).to eq(1)
    end
  end

  context "with a single height" do
    let(:h) { [5] }
    it "returns 1" do
      expect(solution(h)).to eq(1)
    end
  end
end
