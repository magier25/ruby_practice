class Squares
  attr_reader :number
  def initialize(number)
    @number = number
  end
  def square_of_sum
    (1..number).sum ** 2
    # instead of range
    # (number + 1).times.sum ** 2
    # better
    #  (number * (number + 1) / 2) ** 2
  end

  def sum_of_squares
    (1..number).map {|i| i ** 2}.sum
  end

  def difference
    square_of_sum - sum_of_squares
  end
end