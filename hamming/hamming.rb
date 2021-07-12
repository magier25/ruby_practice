module Hamming
  def self.compute(seq1, seq2)
    raise ArgumentError if seq1.size != seq2.size

#    seq1.chars.zip(seq2.chars).filter{|elem| elem.first != elem.last}.size
    seq1.chars.zip(seq2.chars).count { |item| item.first != item.last }
  end
end

=begin
module Hamming
  def self.compute(seq1, seq2)
    raise ArgumentError if seq1.size != seq2.size

    seq1.chars.zip(seq2.chars).count { |n1, n2| n1 != n2 }
  end
end
=end