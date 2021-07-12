module Isogram

  def self.isogram?(input)
    i = input.downcase.gsub(/[ ,-]/, "").chars
    i.uniq == i
  end
end

=begin
class Isogram
  def self.isogram?(input)
    input = input.downcase.scan(/\w/)

    input.uniq == input
  end
end
=end