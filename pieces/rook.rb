class Rook < Piece
  include Slideable

  def initialize(board, color, pos)
    super(board, color, pos)
    @value = 5
  end
  attr_reader :value

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
