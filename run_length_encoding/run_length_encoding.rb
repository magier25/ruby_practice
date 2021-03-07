class RunLengthEncoding
  def self.encode(input)
    return '' if input.empty?

    result = {
      output: '',
      letter: '',
      buf: '',
    }

    input.split("").each_with_object(result) do |letter, obj|
      if obj[:letter] == ''
        obj[:letter] = letter
        obj[:buf] += letter
      elsif obj[:letter] == letter
        obj[:buf] += letter
      else
        obj[:output] += code_letter(obj[:buf].size, obj[:letter])
        obj[:buf] = letter
        obj[:letter] = letter
      end
    end

    result[:output] += code_letter(result[:buf].size, result[:letter])
    
    return result[:output]

  end

  def self.decode(input)
    result = ''
    until input.empty?
      m = input.match(/^(?<number>\d+)(?<letter>[\w ])(?<rest>.*)/)
      if m
        result += (m[:letter] * m[:number].to_i)
        input = m[:rest]
        next
      end

      m = input.match(/^(?<letter>[\w ])(?<rest>.*)/)
      if m
        result += m[:letter]
        input = m[:rest]
      end
    end

    result
  end

  private

  def self.code_letter(num, letter)
    return letter if num == 1

    "#{num}#{letter}"
  end

end


=begin
# excellet solution

class RunLengthEncoding
  def self.encode(plaintext)
    plaintext.gsub(/(.)\1+/) { |group| "#{group.length}#{group[0]}" }
  end

  def self.decode(code)
    code.gsub(/(\d+)(\D)/) { Regexp.last_match(2) * Regexp.last_match(1).to_i }
  end
end
=end