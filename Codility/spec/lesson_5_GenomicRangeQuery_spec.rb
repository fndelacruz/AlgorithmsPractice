require "rspec"
require "lesson_5_GenomicRangeQuery"

describe "#solution(s, p, q)" do
  it "returns array of consecutive answers to all queries" do
    s = "CAGCCTA"
    p_var = [2, 5, 0]
    q_var = [4, 5, 6]
    result = [2, 4, 1]
    expect(solution(s, p_var, q_var)).to eq(result)
  end
end
