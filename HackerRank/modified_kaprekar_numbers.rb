def is_kaprekar?(num)
  num_digits = num.to_s.length
  squared = (num ** 2).to_s

  right = squared[-num_digits..-1]
  left = squared[0...-num_digits]

  if right.to_i + left.to_i == num
    true
  else
    false
  end
end

def kaprekar(min, max)
  kaprekars = (min..max).to_a.select{ |num| is_kaprekar? num }
  if kaprekars.empty?
    puts 'INVALID RANGE'
  else
    puts kaprekars.join(' ')
  end
end
