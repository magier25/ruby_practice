# solution from https://exercism.io/tracks/ruby/exercises/dominoes/solutions/7c30d049c69246d3802ba4317d4d722a
class Dominoes
  def self.chain?(dominos)
    dominos_count = dominos.count
    if dominos_count == 0
      true
    elsif dominos_count == 1
      dominos.first.first == dominos.first.last
    else
      dominos.permutation(dominos_count).any? do |chain_candidate|
        is_chain?(chain_candidate)
      end
    end
  end

  private

  def self.is_chain?(dominos)
    dominos.reduce(dominos.last) do |previous_domino, current_domino|
      if previous_domino.last == current_domino.first
        current_domino
      else
        if previous_domino.last == current_domino.last
          current_domino.reverse
        else
          return false
        end
      end
    end

    true
  end
end

=begin
# my solution is terrible because using second permutation. It's not necessary because enough is rotating stones according to the rules.
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
=end
