require_relative 'piece'
require_relative 'sliding'

class Bishop < Piece
  include Sliding

  def to_s
    @color == :white ? " ♗ " : " ♝ "
  end

  def move_dirs
    Sliding::DIAGONAL_DIRS
  end

  def inspect
    "♗, #{@color}, #{@pos}"
  end
end
