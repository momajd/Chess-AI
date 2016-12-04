require 'singleton'

class EmptySquare < Piece
  include Singleton

  def initialize
    @color = :none
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
