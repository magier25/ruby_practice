class Board
  attr_reader :board
  def transform(input)
    @board = input.map {|line| line.chars }
    raise ArgumentError unless valid?
    calculate_mines
    board.map { |line| line.join }
  end

  def valid?
    return false unless board.all? { |line| line.size == board[0].size }
    return false unless board[1..-2].map {|line| line.first == "|" && line.last == "|"}.all?(true)
    return false unless board.first.all? {|i| ["+", "-"].include?(i) }
    return false unless board.last.all? {|i| ["+", "-"].include?(i) }
    return false if board.flatten.sort.uniq - [" ", "*", "+", "-", "|"] != []

    true
  end

  def cell(row, col)
    board.dig(row, col)
  end

  def calculate_mines
    (0..board.size).each do |ridx|
      (0..board[0].size).each do |cidx|
        calulate_mines_for_cell(ridx, cidx) if cell(ridx, cidx) == ' '
      end
    end
  end

  def calulate_mines_for_cell(row, col)
    mines = neighbours(row, col).count('*')
    board[row][col] = mines.zero? ? ' ' : mines.to_s
  end

  def neighbours(row, col)
    result = []
    (-1..1).each do |roffset|
      (-1..1).each do |coffset|
        next if roffset.zero? && coffset.zero?
        result << cell(row + roffset, col + coffset)
      end
    end
    result
  end

  def self.transform(input)
    self.new.transform(input)
  end
end