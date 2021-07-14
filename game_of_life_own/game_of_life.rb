
class Cell
  
  def initialize(state)
    @state = (state == 'O')
    @new_state = @state
  end

  def live?
    @state
  end

  def live!
    @new_state = true
    self
  end

  def die!
    @new_state = false
    self
  end

  def update
    @state = @new_state
  end

  def to_s
    live? ? 'O' : ' '
  end
end

class World
  attr_reader :world

  def initialize(input)
    @world = input.map do |line| 
      line.chars.map { |c| Cell.new(c) }
    end
  end

  def next_generation
    each_cell do |row, col|
      calc_new_state(row, col)
    end

    each_cell do |row, col|
      cell(row, col).update
    end
  end

  def each_cell
    (0...@world.size).each do |row|
      (0...@world[0].size).each do |col|
        yield row, col
      end
    end
  end

  def calc_new_state(row, col)
    c = cell(row, col)
    live_count = neighbours(row, col).count(&:live?)

    if c.live? && (live_count == 2 || live_count == 3)
      c.live!
    elsif !c.live? && live_count == 3
      c.live!
    else
      c.die!
    end
  end

  def neighbours(row, col)
    max_row = world.size
    max_col = world[0].size
    result = []
    (-1..1).each do |r_off|
      (-1..1).each do |c_off|
        r = row + r_off
        c = col + c_off
        next if r < 0 || r >= max_row || c < 0 || c >= max_col
        next if r == row && c == col

        result.push(cell(r, c))
      end
    end

    result
  end

  def to_a
    world.map {|row| row.join }
  end

  def to_s
    to_a.join("\n")
  end

  def cell(row, col)
    world.dig(row, col)
  end
end
