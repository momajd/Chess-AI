class King < Piece
  include Steppable

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
