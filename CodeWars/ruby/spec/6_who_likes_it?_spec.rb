require "rspec"
require "6_who_likes_it?"

describe "#likes" do
  context "creates text for a 'like' message" do
    it "handles 0 people" do
      expect(likes([])).to eq("no one likes this")
    end

    it "handles 1 people" do
      expect(likes(['Peter'])).to eq("Peter likes this")
    end

    it "handles 2 people" do
      expect(likes(['Jacob', 'Alex'])).to eq("Jacob and Alex like this")
    end

    it "handles 3 people" do
      expect(likes(['Max', 'John', 'Mark'])).to eq("Max, John and Mark like this")
    end

    it "handles 4 people" do
      expect(likes(['Alex', 'Jacob', 'Mark', 'Max'])).to eq("Alex, Jacob and 2 others like this")
    end
  end
end
