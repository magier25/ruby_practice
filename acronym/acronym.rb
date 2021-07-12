class Acronym
  def self.abbreviate(input)
    input.split(/[ -]/).map {|item| item[0] }.delete_if(&:nil?).join.upcase
  end
end

=begin
module Acronym
  def self.abbreviate(phrase)
    phrase.split(/\W/).map(&:chr).join.upcase
  end
end
=end