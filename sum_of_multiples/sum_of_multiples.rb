class SumOfMultiples

  def initialize(*args)
    @nums = args
  end

  def to(high)
    (1...high).to_a.filter { |i| @nums.any? { |n| i % n == 0 } }.sum
  end

end