require "rspec"
require "13_RomanToInteger"

describe "#roman_to_int(s)" do
  context "when given a Romam Numeral" do
    it "between 1-10, it returns the corresponding integer" do
      expect(roman_to_int("I")).to eq(1)
    end
    it "between 1-10, it returns the corresponding integer" do
      expect(roman_to_int("IV")).to eq(4)
    end
    it "between 1-10, it returns the corresponding integer" do
      expect(roman_to_int("VI")).to eq(6)
    end
    it "between 1-10, it returns the corresponding integer" do
      expect(roman_to_int("IX")).to eq(9)
    end
    it "between 1-10, it returns the corresponding integer" do
      expect(roman_to_int("X")).to eq(10)
    end

    it "between 11-20, it returns the corresponding integer" do
      expect(roman_to_int("XI")).to eq(11)
    end
    it "between 21-30, it returns the corresponding integer" do
      expect(roman_to_int("XXVII")).to eq(27)
    end
    it "between 31-40, it returns the corresponding integer" do
      expect(roman_to_int("XXVII")).to eq(27)
    end
    it "between 41-50, it returns the corresponding integer" do
      expect(roman_to_int("XLIII")).to eq(43)
    end
    it "between 51-60, it returns the corresponding integer" do
      expect(roman_to_int("LV")).to eq(55)
    end
    it "between 61-70, it returns the corresponding integer" do
      expect(roman_to_int("LXIV")).to eq(64)
    end
  end
end
