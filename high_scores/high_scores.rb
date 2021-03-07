class HighScores
  attr_reader :scores

  def initialize(scores)
    @scores = scores
  end

  def personal_best
    # scores.sort.last
    # better
    scores.max
  end

  def latest
    scores.last
  end

  def personal_top_three
    #scores.sort.last(3).reverse
    # better
    scores.max(3)
  end

  def latest_is_personal_best?
    latest == personal_best
  end
end