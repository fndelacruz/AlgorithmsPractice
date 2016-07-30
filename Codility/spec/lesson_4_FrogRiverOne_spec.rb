require "rspec"
require "lesson_4_FrogRiverOne"

describe "#solution(x, a)" do

  context "for existant path solutions" do
    it "returns earliest second when frog can cross river" do
      expect(solution(5, [1, 3, 1, 4, 2, 3, 5, 4])).to eq(6)
    end

    it "returns earliest second when frog can cross river" do
      expect(solution(2, [1, 3, 1, 4, 2, 3, 5, 4])).to eq(4)
    end

    it "handles single step path" do
      expect(solution(1, [1])).to eq(0)
    end
  end

  context "for nonexistant path solutions" do
    it "returns -1 when frog cannot cross river" do
      expect(solution(5, [1, 3, 1, 4, 2, 3, 2, 4])).to eq(-1)
    end

    it "returns -1 when frog cannot cross river" do
      expect(solution(5, [1])).to eq(-1)
    end

    it "returns -1 when frog cannot cross river" do
      expect(solution(5, [100])).to eq(-1)
    end

    it "returns -1 when frog cannot cross river" do
      expect(solution(5, [1, 2, 4, 2, 1, 3, 9, 20])).to eq(-1)
    end
  end
end
