require 'minitest/autorun'
require_relative 'game_of_life'

class GameOfLifeTest < Minitest::Test

  def test_cell_state
    assert !Cell.new(' ').live?
    
    c = Cell.new('O')
    assert_equal true, c.live?
    c.die!.update
    assert_equal false, c.live?
    c.live!.update
    assert_equal true, c.live?
  end

  def test_transform0
    inp = ['   ', '   ', '   ']
    out = ['   ', '   ', '   ']
    
    world = World.new(inp)
    world.next_generation
    assert_equal out, world.to_a
  end

  def test_transform1
    inp = ['   ', ' O ', '   ']
    out = ['   ', '   ', '   ']
    
    world = World.new(inp)
    world.next_generation
    assert_equal out, world.to_a
  end

  def test_transform2
    # skip
    inp = ['OO', 'OO']
    out = ['OO', 'OO']
    
    world = World.new(inp)
    world.next_generation
    assert_equal out, world.to_a
  end

  def test_transform3
    # skip
    inp = [' O ', ' O ', ' O ']
    out = ['   ', 'OOO', '   ']
    
    world = World.new(inp)
    world.next_generation
    assert_equal out, world.to_a
  end

  def test_transform4
    inp = ['   ', 
           ' OO', 
           '  O']
    out = ['   ', 
           ' OO', 
           ' OO']
    
    world = World.new(inp)
    world.next_generation
    assert_equal out, world.to_a
  end
end