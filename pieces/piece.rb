class Piece

  def initialize(board, color, pos)
    @board, @color, @pos = board, color, pos
  end
  attr_reader :board, :color
  attr_accessor :pos

  def empty?
    false
  end
end
