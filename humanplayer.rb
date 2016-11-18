require_relative 'display'
require 'byebug'

class HumanPlayer

  attr_reader :color

  def initialize(color, display)
    @color = color
    @display = display
  end

  def get_move
    cols = %w(a b c d e f g h)
    rows = %w(8 7 6 5 4 3 2 1)

    from_pos, to_pos = nil, nil
    until from_pos && to_pos
      @display.render
      if from_pos
        row, col = from_pos
        puts "#{cols[col]}#{rows[row]} selected. Where to move to?"
        to_pos = @display.get_input
      else
        puts "What piece do you want to move?"
        from_pos = @display.get_input
      end
    end
    [from_pos, to_pos]
  end
end
