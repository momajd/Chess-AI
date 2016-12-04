class Knight < Piece
  include Stepping

  def to_s
    @color == :white ? " ♘ " : " ♞ "
  end

  def move_dirs
    Stepping::KNIGHT_DIRS
  end

  def inspect
    "♘, #{@color}, #{@pos}"
  end
end
