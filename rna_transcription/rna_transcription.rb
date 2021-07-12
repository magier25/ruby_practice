module Complement
  DNA_TO_RNA = {
    'C' => 'G',
    'G' => 'C',
    'T' => 'A',
    'A' => 'U',
  }
  
  def self.of_dna(sequence)
    sequence.chars.map { |n| DNA_TO_RNA[n] }.join
  end
end