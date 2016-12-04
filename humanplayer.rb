require_relative 'display'

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
        piece = @display.board[from_pos].class.to_s
        puts "#{piece} from #{cols[col]}#{rows[row]} selected. Where to move to?"
        to_pos = @display.get_input
      else
        puts "#{@color.capitalize}'s move"
        puts "What piece do you want to move?"
        selection = @display.get_input
        from_pos = selection if selection && valid_selection?(selection)
      end
    end
    [from_pos, to_pos]
  end

  def valid_selection?(pos)
    piece = @display.board[pos]
    piece.color == @color
  end
end
