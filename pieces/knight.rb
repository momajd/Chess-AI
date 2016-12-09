class Knight < Piece
  include Steppable

  def initialize(board, color, pos)
    super(board, color, pos)
    @value = 3
  end
  attr_reader :value

  def to_s
    @color == :white ? " ♘ " : " ♞ "
  end

  def move_dirs
    [
      [2, 1],
      [1, 2],
      [-1, 2],
      [-2, 1],
      [-2, -1],
      [-1, -2],
      [1, -2],
      [2, -1]
    ]
  end

  def inspect
    "♘, #{@color}, #{@pos}"
  end
end
