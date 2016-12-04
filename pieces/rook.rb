class Rook < Piece
  include Sliding

  def to_s
    @color == :white ? " ♖ " : " ♜ "
  end

  def move_dirs
    Sliding::HORIZONTAL_DIRS
  end

  def inspect
    "♖, #{@color}, #{@pos}"
  end
end
