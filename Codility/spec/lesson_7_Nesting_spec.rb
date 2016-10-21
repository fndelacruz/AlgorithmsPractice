require "rspec"
require "lesson_7_Nesting"

describe "#solution(a)" do
  context "with properly nested string" do
    context "with simplest nest" do
      let(:a) { "()" }
      it "returns 1" do
        expect(solution(a)).to eq(1)
      end
    end

    context "with empty string" do
      let(:a) { "" }
      it "returns 1" do
        expect(solution(a)).to eq(1)
      end
    end

    context "with complex grouping" do
      let(:a) { "(()())()((())())" }
      it "returns 1" do
        expect(solution(a)).to eq(1)
      end
    end
  end

  context "with improperly nested string" do
    context "single open paren" do
      let(:a) { "(" }
      it "returns 0" do
        expect(solution(a)).to eq(0)
      end
    end

    context "single closed paren" do
      let(:a) { ")" }
      it "returns 0" do
        expect(solution(a)).to eq(0)
      end
    end

    context "opposite pairs" do
      let(:a) { ")(" }
      it "returns 0" do
        expect(solution(a)).to eq(0)
      end
    end

    context "same pairs" do
      let(:a) { "((" }
      it "returns 0" do
        expect(solution(a)).to eq(0)
      end
    end

    context "complex grouping" do
      let(:a) { "(()()((()))))((()))(" }
      it "returns 0" do
        expect(solution(a)).to eq(0)
      end
    end
  end
end
