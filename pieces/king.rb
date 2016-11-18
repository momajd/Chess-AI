require_relative 'piece'
require_relative 'stepping'

class King < Piece
  include Stepping

  def to_s
    @color == :white ? " ♔ " : " ♚ "
  end

  def move_dirs
    Stepping::KING_DIRS
  end

  def inspect
    "♔, #{@color}, #{@pos}"
  end
end
