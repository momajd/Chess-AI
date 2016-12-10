require 'colorize'
require_relative 'cursorable'

class Display
  include Cursorable

  attr_reader :board, :notifications

  def initialize(board)
    @board = board
    @cursor_pos = [6,4] #start at pawn in front of king
    @notifications = {}
  end

  def build_grid
    @board.rows.map.with_index do |row, i|
      build_row(row, i)
    end
  end

  def build_row(row, i)
    row.map.with_index do |piece, j|
      color_options = colors_for(i, j)
      piece.to_s.colorize(color_options)
    end
  end

  def colors_for(i, j)
    if [i, j] == @cursor_pos
      bg = :light_red
    elsif (i + j).odd?
      bg = :light_white
    else
      bg = :light_cyan
    end
    { color: :black, background: bg }
  end

  def render
    system("clear")
    puts "Arrow keys or WASD to move; space or enter to confirm."

    row_notation = %w(8 7 6 5 4 3 2 1)
    build_grid.each_with_index do |row, i|
      puts row_notation[i].colorize(:red) + row.join
    end
    puts "  a  b  c  d  e  f  g  h".colorize(:red)

    @notifications.each do |key, val|
      puts val
    end
  end

  def set_check!
    @notifications[:check] = "Check!"
  end

  def clear_check!
    @notifications.delete(:check)
  end

  def reset_errors!
    @notifications.delete(:error)
  end
end
