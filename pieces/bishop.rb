class Bishop < Piece
  include Slideable

  def initialize(board, color, pos)
    super(board, color, pos)
    @value = 3
  end
  attr_reader :value

  def to_s
    @color == :white ? " ♗ " : " ♝ "
  end

  def move_dirs
    Slideable::DIAGONAL_DIRS
  end

  def inspect
    "♗, #{@color}, #{@pos}"
  end
end
