require_relative 'chess_node'

class ComputerPlayer
  def initialize(color, display)
    @color = color
    @display = display

    @ply_depth = 2 #the number of moves that the computer looks ahead
  end
  attr_reader :color

  def get_move
    @display.render
    puts "thinking..."

    root = ChessNode.new(@display.board, color)
    best_score = minimax(root, @ply_depth)

    best_node = root.children.find {|node| node.value == best_score}
    best_node.previous_move
  end

  def minimax(node, depth, maximizing_player = true)
    if depth == 0 || node.children.empty?
      return node.value = node.evaluate
    end

    if maximizing_player
      best_value = -Float::INFINITY

      node.children.each do |child|
        child_value = minimax(child, depth - 1, false)
        best_value = [best_value, child_value].max
      end
    else
      best_value = Float::INFINITY

      node.children.each do |child|
        child_value = minimax(child, depth - 1, true)
        best_value = [best_value, child_value].min
      end
    end

    node.value = best_value
  end
end
