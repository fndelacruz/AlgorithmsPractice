require "rspec"
require "lesson_5_MinAvgTwoSlice"
require "byebug"

describe "#solution(a)" do
  it "returns earliest index of slice with global minimum average" do
    expect(solution([4, 2, 2, 5, 1, 5, 8])).to eq(1)
  end

   context "with two elements" do
     it "returns earliest index of slice with global minimum average" do
       expect(solution([-10000, 10000])).to eq(0)
     end
   end

  #  context "with 10 random elements" do
  #    it "returns earliest index of slice with global minimum average" do
  #      array = 10.times.map { rand(300) }
  #      expect(solution(array)).to eq(true)
  #    end
  #  end
end
