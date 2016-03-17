require 'singleton'

class Piece

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

#p EmptySquare.instance.color
