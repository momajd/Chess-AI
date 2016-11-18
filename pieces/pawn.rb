require_relative 'piece'

class Pawn < Piece

  def to_s
    @color == :white ? " ♙ " : " ♟ "
  end

  def move_dirs
    #TODO
  end

  def inspect
    "♙, #{@color}, #{@pos}"
  end
end
