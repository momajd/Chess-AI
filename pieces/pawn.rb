require_relative 'piece'

class Pawn < Piece

  attr_reader :board, :pos
  def initialize(board, color, pos)
    @board, @color, @pos = board, color, pos
  end

  def to_s
    if @color == :white
      " ♙ "
    else
      " ♟ "
    end
  end

  def move_dirs
    #RETURN TO THIS
  end

  def inspect
    "♙, #{@color}, #{@pos}"
  end
end
