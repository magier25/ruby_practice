require_relative 'game_of_life'

class GameOfLife
  attr_reader :width, :height

  def initialize(width = 30, height = 20)
    @width, @height = width, height
  end

  def run
    input = (0...height).each_with_object([]) do |r, a|
      a << Array.new(width) {[' ', 'O'].sample }.join
    end

    world = World.new(input)
    loop do
      system('clear')
      puts world.to_s
      world.next_generation
      sleep(0.1)
    end
  end
end

GameOfLife.new(300, 100).run