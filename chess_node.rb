class ChessNode

  def initialize(board, current_player, previous_move = nil)
    @board = board
    @current_player = current_player
    @previous_move = previous_move
    @value = nil #set in minimax algo
  end
  attr_reader :board, :current_player, :previous_move
  attr_accessor :value

  def evaluate
    opponent = current_player == :white ? :black : :white

    if board.checkmate?(opponent)
      return Float::INFINITY
    elsif board.checkmate?(current_player)
      return -Float::INFINITY
    end

    current_player_score = 0
    opponent_score = 0

    board.pieces.each do |piece|
      if piece.color == current_player
        current_player_score += piece.value
      else
        opponent_score += piece.value
      end
    end

    current_player_score - opponent_score
  end

  def children
    return @children if @children
    @children = []
    opponent = current_player == :white ? :black : :white

    board.pieces_by_color(current_player).each do |piece|
      piece.valid_moves.each do |end_pos|
        child_board = board.dup
        child_board.move_piece(piece.pos, end_pos)
        @children << ChessNode.new(child_board, opponent, [piece.pos, end_pos])
      end
    end

    @children.shuffle!
  end

end
