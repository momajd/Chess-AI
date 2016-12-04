require_relative 'pieces'

class Board
  attr_reader :rows

  def initialize
    make_starting_board
  end

  def [](pos)
    x, y = pos
    @rows[x][y]
  end

  def []=(pos, piece)
    x, y = pos
    @rows[x][y] = piece
  end

  def move_piece(from_pos, to_pos)
    raise 'No piece at that position' if self[from_pos].empty?
    piece = self[from_pos]

    self[to_pos] = piece
    self[from_pos] = EmptySquare.instance
  end

  def checkmate?
    false   #TODO
  end

  def pos_in_bounds?(pos)
    pos.all? {|coord| coord.between?(0,7)}
  end

  def make_starting_board
    @rows = Array.new(8) {Array.new(8) {EmptySquare.instance}}
    populate_back_row
    populate_pawns
  end


  def populate_back_row
    back_pieces = [Rook, Knight, Bishop, Queen, King, Bishop, Knight, Rook]
    [[0, :black], [7, :white]].each do |row, color|
      back_pieces.each_with_index do |piece_class, col|
        self[[row, col]] = piece_class.new(self, color, [row, col])
      end
    end
  end

  def populate_pawns
    8.times {|col| self[[1, col]] = Pawn.new(self, :black, [1, col])}
    8.times {|col| self[[6, col]] = Pawn.new(self, :white, [1, col])}
  end

end
