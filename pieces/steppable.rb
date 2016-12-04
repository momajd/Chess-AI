module Steppable

  def moves
    moves = []
    cur_x, cur_y = @pos
    self.move_dirs.each do |dx, dy|
      pos = cur_x + dx, cur_y + dy
      moves << pos if @board.in_bounds?(pos) && @board[pos].color != @color
    end

    moves
  end
end
