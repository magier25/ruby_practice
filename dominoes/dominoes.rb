class Dominoes
  def self.chain?(dominoes)
    return true if dominoes.empty?

    valid_order = dominoes.permutation(dominoes.size).find do |comb| 
      valid?(comb)
    end
    !valid_order.nil?
  end

  def self.valid?(comb)
    resp = [true, false].repeated_permutation(comb.size).map do |flip|
      next false if turn(comb.first, flip.first).first != turn(comb.last, flip.last).last
      correct = for idx in (0...comb.size-1)
        break false if turn(comb[idx], flip[idx]).last != turn(comb[idx+1], flip[idx+1]).first
      end
      next false unless correct

      true
    end

    resp.any?{ |item| item }
  end

  def self.turn(item, flip)
    return item unless flip

    [item[1], item[0]]
  end
end