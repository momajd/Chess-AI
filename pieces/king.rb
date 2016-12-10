class King < Piece
  include Steppable

  def initialize(board, color, pos)
    super(board, color, pos)
    @value = 10 #real value is infinity
  end
  attr_reader :value

  def to_s
    @color == :white ? " ♔ " : " ♚ "
  end

  def move_dirs
    [
      [1, 0],
      [1, 1],
      [0, 1],
      [-1, 1],
      [-1, 0],
      [-1, -1],
      [0, -1],
      [1, -1]
    ]
  end

  def inspect
    "♔, #{@color}, #{@pos}"
  end
end
