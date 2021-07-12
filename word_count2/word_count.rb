class Phrase
  def initialize(phrase)
    @phrase = phrase
  end

  def word_count
    @phrase.split(/[ ,:!&@$%\^&\.\n]/)
      .map { |i| i.start_with?("'") && i.end_with?("'") ? i[1..-2] : i }
      .filter { |i| !i.empty? }.map(&:downcase).tally
  end
end

=begin
class Phrase
  def initialize(phrase)
    @word_count = phrase.downcase.scan(/\b[\w']+\b/).tally
  end

  attr_reader :word_count
end
=end