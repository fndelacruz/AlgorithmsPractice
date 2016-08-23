require "rspec"
require "lesson_7_Fish"

describe "#solution(a, b)" do
  context "with default example" do
    let(:a) { [4, 3, 2, 1, 5] }
    let(:b) { [0, 1, 0, 0, 0] }
    it "should return number of remaining fish" do
      expect(solution(a, b)).to eq(2)
    end
  end

  context "with custom handmade example" do
    let(:a) { [4, 3, 2, 9, 6, 1, 5, 8] }
    let(:b) { [0, 1, 0, 0, 0, 1, 0, 1] }

    it "should return number of remaining fish" do
      expect(solution(a, b)).to eq(5)
    end
  end

  context "with one fish swimming up" do
    let(:a) { [4] }
    let(:b) { [0] }
    it "should return number of remaining fish" do
      expect(solution(a, b)).to eq(1)
    end
  end

  context "with one fish swimming down" do
    let(:a) { [4] }
    let(:b) { [0] }
    it "should return number of remaining fish" do
      expect(solution(a, b)).to eq(1)
    end
  end

  context "with all upstream fish" do
    let(:a) { [4, 3, 2, 1] }
    let(:b) { [0, 0, 0, 0] }
    it "should return number of remaining fish" do
      expect(solution(a, b)).to eq(4)
    end
  end

  context "with all downstream fish" do
    let(:a) { [4, 3, 2, 1] }
    let(:b) { [1, 1, 1, 1] }
    it "should return number of remaining fish" do
      expect(solution(a, b)).to eq(4)
    end
  end

  context "with no fish encounters" do
    let(:a) { [4, 3, 2, 1] }
    let(:b) { [0, 0, 1, 1] }
    it "should return number of remaining fish" do
      expect(solution(a, b)).to eq(4)
    end
  end

  context "with one upstream fish and rest downstream fish, no encounters" do
    let(:a) { [9, 4, 3, 2, 1] }
    let(:b) { [0, 1, 1, 1, 1] }
    it "should return number of remaining fish" do
      expect(solution(a, b)).to eq(5)
    end
  end

  context "with one downstream fish and rest up fish, no encounters" do
    let(:a) { [9, 4, 3, 2, 1] }
    let(:b) { [0, 0, 0, 0, 1] }
    it "should return number of remaining fish" do
      expect(solution(a, b)).to eq(5)
    end
  end

  context "with one big downstream fish and rest up fish, with encounters" do
    let(:a) { [9, 4, 3, 2, 1] }
    let(:b) { [1, 0, 0, 0, 0] }
    it "should return number of remaining fish" do
      expect(solution(a, b)).to eq(1)
    end
  end

  context "with one big upstream fish and rest down fish, with encounters" do
    let(:a) { [1, 4, 3, 2, 9] }
    let(:b) { [1, 1, 1, 1, 0] }
    it "should return number of remaining fish" do
      expect(solution(a, b)).to eq(1)
    end
  end
end
