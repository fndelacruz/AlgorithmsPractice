require "rspec"
require "lesson_3_TapeEquilibrium"

describe "#solution(a)" do
  it "returns minimal distance" do
    expect(solution([3, 1, 2, 4, 3])).to eq(1)
  end

  context "when given array with 2 elements" do
    it "returns the only distance" do
      expect(solution([3, 1])).to eq(2)
    end

    it "returns the only distance" do
      expect(solution([1, 3])).to eq(2)
    end
  end

end
