class Piece

  def initialize(board, color, pos)
    @board, @color, @pos = board, color, pos
  end
  attr_reader :board, :color
  attr_accessor :pos

  def empty?
    false
  end

  def valid_moves
    self.moves.reject do |move|
      board.move_into_check?(pos, move, color)
    end
  end
end
