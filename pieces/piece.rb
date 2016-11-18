require 'singleton'

class Piece

  def initialize(board, color, pos)
    @board, @color, @pos = board, color, pos
  end
  attr_reader :board, :color, :pos

  def empty?
    false
  end
end


class EmptySquare
  include Singleton

  attr_reader :color, :pos
  def initialize(color = :none)
    #@board = board
    @color = color
    #@pos = pos
  end

  def to_s
    "   "
  end

  def empty?
    true
  end

  def inspect
    "empty"
  end
end
