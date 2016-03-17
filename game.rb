require_relative 'board'
require_relative 'display'
require_relative 'humanplayer'

class Game
  def initialize
    @board = Board.new
    @display = Display.new(@board)
    @players = {
      white: HumanPlayer.new(:white, @display),
      black: HumanPlayer.new(:black, @display)
    }
    @current_player = :white
  end

  def play
    until @board.checkmate?
      #get move from player
      from_pos, to_pos = @players[@current_player].get_move
      @board.move_piece(from_pos, to_pos)
    end
  end
end


if __FILE__ == $PROGRAM_NAME
  Game.new.play
end
