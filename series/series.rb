class Series
  attr_reader :input

  def initialize(input)
    @input = input
  end

  def slices(len)
    raise ArgumentError if len > input.length

    output = []
    for idx in 0..(input.length - len)
      output.push(input.slice(idx, len))
    end

    output
  end
end

=begin
class Series
  attr_reader :digits

  def initialize(digits)
    @digits = digits.chars
  end

  def slices(length)
    raise ArgumentError if length > digits.length
    digits.each_cons(length).map(&:join)
  end
end
=end