class Rook < Piece
  include Slideable

  def to_s
    @color == :white ? " ♖ " : " ♜ "
  end

  def move_dirs
    Slideable::HORIZONTAL_DIRS
  end

  def inspect
    "♖, #{@color}, #{@pos}"
  end
end
