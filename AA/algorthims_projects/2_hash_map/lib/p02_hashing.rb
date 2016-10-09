class Fixnum
  # Fixnum#hash already implemented for you
end

class Array
  def hash
    reduce(first.hash) do |current_hash, el, idx|
      current_hash ^ el.hash ^ idx.hash % el.hash
    end
  end
end

class String
  def hash
    split("").map(&:ord).hash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    to_a.sort.map(&:hash).hash
  end
end
