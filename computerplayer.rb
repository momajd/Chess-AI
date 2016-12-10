require_relative 'chess_node'

class ComputerPlayer
  def initialize(color, display)
    @color = color
    @display = display

    @max_depth = 3
  end
  attr_reader :color

  def get_move
    @display.render
    puts "thinking..."

    root = ChessNode.new(@display.board, color)
    best_score = minimax(root, @max_depth)

    best_node = root.children.find {|node| node.value == best_score}
    best_node.previous_move
  end

  def minimax(node, depth, maximizing_player = true)
    return node.evaluate if depth == 0 || node.children.empty?

    if maximizing_player
      best_value = -Float::INFINITY

      node.children.each do |child|
        child_value = minimax(child, depth - 1, false)
        best_value = child_value if child_value > best_value
      end
    else
      best_value = Float::INFINITY

      node.children.each do |child|
        child_value = minimax(child, depth - 1, true)
        best_value = child_value if child_value < best_value
      end
    end

    node.value = best_value #need to store this value; see 'get_move'
  end
end