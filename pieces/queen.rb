require_relative 'piece'
require_relative 'sliding'

class Queen < Piece
  include Sliding
  
  def to_s
    @color == :white ? " ♕ " : " ♛ "
  end

  def move_dirs
    Sliding::DIAGONAL_DIRS + Sliding::HORIZONTAL_DIRS
  end

  def inspect
    "♕, #{@color}, #{@pos}"
  end
end
