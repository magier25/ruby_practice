class Grains
  # not optimized version
  def self.square(num)
    raise ArgumentError if num < 1 || num > 64
    2**(num-1)
  end

  def self.total
    (1..64).map { |i| square(i) }.sum
  end
end
