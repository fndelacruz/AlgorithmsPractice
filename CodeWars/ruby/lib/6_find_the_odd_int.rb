def find_it(array)
  table = Hash.new { |h, k| h[k] = false }
  array.each { |el| table[el] = !table[el] }
  table.each { |k, v| return k if v }
end
