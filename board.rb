require_relative 'pieces'
require 'byebug'

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

  def move_piece(from_pos, end_pos)
    raise 'No piece at that position' if self[from_pos].empty?

    piece = self[from_pos]

    self[to_pos] = piece
    self[from_pos] = EmptySquare.instance
  end

  def checkmate?
    false   #REVISE
  end

  def pos_in_bounds?(pos)
    pos.all? {|coord| coord.between?(0,7)}
  end

  def make_starting_board
    #start with putting empty pieces everywhere
    @rows = Array.new(8) {Array.new(8) {EmptySquare.instance}}

    #back rows
    back_pieces = [Rook, Knight, Bishop, Queen, King, Bishop, Knight, Rook]
    [[0, :white], [7, :black]].each do |row, color|
      back_pieces.each_with_index do |piece_class, col|
        self[[row, col]] = piece_class.new(self, color, [row, col])
      end
    end
  end

end
