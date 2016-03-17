require_relative 'piece'
require_relative 'stepping'

class King < Piece
  include Stepping

  attr_reader :board, :pos
  def initialize(board, color, pos)
    @board, @color, @pos = board, color, pos
  end

  def to_s
    if @color == :white
      " ♔ "
    else
      " ♚ "
    end
  end

  def move_dirs
    Stepping::KING_DIRS
  end

  def inspect
    "♔, #{@color}, #{@pos}"
  end
end
