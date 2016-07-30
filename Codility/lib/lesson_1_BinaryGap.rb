def solution(n)
  num = n
  longest_gap = 0
  current_gap = nil

  until num == 0
    if num % 2 == 1
      longest_gap = current_gap if current_gap && current_gap > longest_gap
      current_gap = 0
    else
      current_gap += 1 if current_gap
    end

    num /= 2
  end

  longest_gap
end
