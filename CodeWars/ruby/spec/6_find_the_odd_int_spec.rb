require "rspec"
require "6_find_the_odd_int"

describe "#find_it" do
  context "finds the int that appears an odd number of times" do
    it "works for example 1" do
      expect(find_it([20,1,-1,2,-2,3,3,5,5,1,2,4,20,4,-1,-2,5])).to eq(5)
    end

    it "works for example 2" do
      expect(find_it([1,1,2,-2,5,2,4,4,-1,-2,5])).to eq(-1)
    end

    it "works for example 3" do
      expect(find_it([20,1,1,2,2,3,3,5,5,4,20,4,5])).to eq(5)
    end

    it "works for example 4" do
      expect(find_it([10])).to eq(10)
    end

    it "works for example 5" do
      expect(find_it([1,1,1,1,1,1,10,1,1,1,1])).to eq(10)
    end
  end
end
