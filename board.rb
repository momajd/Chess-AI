require_relative 'pieces'

class Board
  attr_reader :rows

  def initialize
    make_starting_board!

    # keep reference to the kings
    @white_king = self[[0, 4]]
    @black_king = self[[7, 4]]
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
    # raise 'No piece at that position' if self[from_pos].empty?
    piece = self[from_pos]

    raise "That's not a valid move" unless piece.moves.include?(to_pos)
    # TODO check whether moving into check

    self[to_pos] = piece
    self[from_pos] = EmptySquare.instance
    piece.pos = to_pos

    promote_pawn!(piece) if piece.is_a?(Pawn) && back_row?(to_pos)
  end

  def checkmate?
    (in_check?(:white) && @white_king.moves.empty?) || (in_check?(:black) && @black_king.moves.empty?)
  end

  def in_check?(color)
    pieces.any? do |piece|
      piece.color != color && piece.moves.any? {|pos| self[pos].is_a?(King)}
    end
  end

  def pieces
    @rows.flatten.reject {|piece| piece.empty?}
  end

  def in_bounds?(pos)
    pos.all? {|coord| coord.between?(0,7)}
  end

  def empty?(pos)
    self[pos].empty?
  end

  private
  def back_row?(pos)
    pos[0] == 0 || pos[0] == 7
  end

  def promote_pawn!(piece)
    # promote pawn to queen by default
    return unless piece.is_a?(Pawn)
    self[piece.pos] = Queen.new(self, piece.color, piece.pos)
  end

  def make_starting_board!
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
    8.times {|col| self[[6, col]] = Pawn.new(self, :white, [6, col])}
  end

end
