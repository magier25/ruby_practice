class Change

  class ImpossibleCombinationError < StandardError; end
  class NegativeTargetError < StandardError; end

  def self.generate(coins, change_amount)
    raise NegativeTargetError if change_amount < 0
    return [] if change_amount.zero?
    raise ImpossibleCombinationError if change_amount < coins.min

    coins = coins.filter{ |coin| coin <= change_amount }
    max_cycle = (change_amount / coins.min).ceil
    for cycle in (1..max_cycle)
      coins.repeated_combination(cycle) do |change|
        return change.sort if change.sum == change_amount
      end
    end

    raise ImpossibleCombinationError
  end
end