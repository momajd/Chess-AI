require 'byebug'
class Pawn < Piece

  def initialize(board, color, pos)
    super(board, color, pos)
    @value = 1
  end
  attr_reader :value

  def to_s
    @color == :white ? " ♙ " : " ♟ "
  end

  def move_dirs
    one_step = @color == :white ? [-1, 0] : [1, 0]
    two_step = @color == :white ? [-2, 0] : [2, 0]

    first_move? ? [one_step, two_step] : [one_step]
  end

  def attack_dirs
    @color == :white ? [[-1, -1], [-1, 1]] : [[1, -1], [1, 1]]
  end

  def attack_moves
    moves = []
    attack_dirs.each do |dx, dy|
      cur_x, cur_y = @pos
      pos = cur_x + dx, cur_y + dy
      moves << pos if valid_attack_pos?(pos)
    end
    moves
  end

  def valid_attack_pos?(pos)
    @board.in_bounds?(pos) && !@board.empty?(pos) && @board[pos].color != @color
  end

  def forward_moves
    cur_x, cur_y = @pos
    moves = []
    move_dirs.each do |dx, dy|
      pos = cur_x + dx, cur_y + dy
      moves << pos if @board.empty?(pos)
    end
    moves
  end

  def first_move?
    (@pos[0] == 6 && @color == :white) || (@pos[0] == 1 && @color == :black)
  end

  def moves
    forward_moves + attack_moves
  end

  def inspect
    "♙, #{@color}, #{@pos}"
  end
end
