OPEN_SYMBOLS = {
  "(" => true,
  "{" => true,
  "[" => true
}

CLOSED_SYMBOLS = {
  ")" => "(",
  "}" => "{",
  "]" => "["
}

def group_check(s)
  open_symbols = []
  s.split("").each do |symbol|
    if OPEN_SYMBOLS[symbol]
      open_symbols << symbol
    elsif CLOSED_SYMBOLS[symbol] && CLOSED_SYMBOLS[symbol]== open_symbols.last
      open_symbols.pop
    else
      return false
    end
  end
  open_symbols.empty?
end
