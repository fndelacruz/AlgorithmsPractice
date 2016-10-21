require "rspec"
require "lesson_7_Brackets"

describe "#solution(a)" do
  context "with proper nesting" do
    context "with blank string" do
      let(:a) { "" }
      it "returns 1" do
        expect(solution(a)).to eq(1)
      end
    end

    context "with given example" do
      let(:a) { "{[()()]}" }
      it "returns 1" do
        expect(solution(a)).to eq(1)
      end
    end
  end

  context "with improper nesting" do
    context "with given example" do
      let(:a) { "([)()]" }
      it "returns 0" do
        expect(solution(a)).to eq(0)
      end
    end
  end
end
