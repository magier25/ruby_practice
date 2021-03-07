class Phrase
  def initialize(words)
    @words = words
  end

  def word_count
    @result ||= count_words
  end

  private

  def count_words
    @words.split(/[ ,:!&@\$%\^&\n\.]/).filter{ |item| !item.empty?}.reduce(Hash.new(0)) do |hash, word|
      word = word.downcase
      word = word[1..-2] if word.start_with?("'") && word.end_with?("'")
      hash[word] += 1
      hash
    end
  end
end


# better solutions
=begin
class Phrase
  def initialize(phrase)
    @words = phrase.downcase.scan(/\b[\w']+\b/)
  end

  def word_count
    @words.inject(Hash.new(0)) {|h, word| h[word] += 1; h}
  end
end

=end
