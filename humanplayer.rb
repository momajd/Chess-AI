require_relative 'display'
require 'byebug'
class HumanPlayer

  attr_reader :color

  def initialize(color, display)
    @color = color
    @display = display
  end

  def get_move
    from_pos, to_pos = nil, nil
    until from_pos && to_pos
      @display.render
      if from_pos
        puts "Where to move to?"
        to_pos = @display.get_input
      else
        puts "What piece do you want to move?"
        from_pos = @display.get_input
      end
      [from_pos, to_pos]
    end
  end
end
