require "rspec"
require "lesson_5_PassingCars"

describe "#solution(a)" do
  context "when number of passing cars is <= 1000000000" do
    it "returns the number of pairs of passing cars" do
      cars = [0, 1, 0, 1, 1]
      expect(solution(cars)).to eq(5)
    end

    context "when all going right" do
      it "returns 0 pairs of passing cars" do
        expect(solution([0, 0, 0, 0])).to eq(0)
      end
    end

    context "when all going left" do
      it "returns 0 pairs of passing cars" do
        expect(solution([1, 1, 1, 1])).to eq(0)
      end
    end

    context "when only a single car" do
      context "going right" do
        it "returns 0 pairs of passing cars" do
          expect(solution([0])).to eq(0)
        end
      end

      context "going left" do
        it "returns 0 pairs of passing cars" do
          expect(solution([1])).to eq(0)
        end
      end
    end
  end
end
