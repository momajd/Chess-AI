require_relative 'piece'
require_relative 'sliding'

class Bishop < Piece
  include Sliding

  attr_reader :board, :pos
  def initialize(board, color, pos)
    @board, @color, @pos = board, color, pos
  end

  def to_s
    if @color == :white
      " ♗ "
    else
      " ♝ "
    end
  end

  def move_dirs
    Sliding::DIAGONAL_DIRS
  end

  def inspect
    "♗, #{@color}, #{@pos}"
  end
end
