require_relative 'piece'
require_relative 'stepping'

class Knight < Piece
  include Stepping

  attr_reader :board, :pos
  def initialize(board, color, pos)
    @board, @color, @pos = board, color, pos
  end

  def to_s
    if @color == :white
      " ♘ "
    else
      " ♞ "
    end
  end

  def move_dirs
    Stepping::KNIGHT_DIRS
  end

  def inspect
    "♘, #{@color}, #{@pos}"
  end
end
