require_relative 'player'

class Board 
  attr_accessor :board

  def initialize
    @board = Array(1..9)
  end

  def show_board
    puts "\n #{@board[0]} | #{@board[1]} | #{@board[2]}"
    puts '-----------'
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]}"
    puts '-----------'
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]}\n"
  end

  def winning_condition(board)
    if [board[0], board[3], board[6]].uniq.size == 1
      true
    elsif [board[0], board[4], board[8]].uniq.size == 1
      true
    elsif [board[0], board[1], board[2]].uniq.size == 1
      true
    elsif [board[1], board[4], board[7]].uniq.size == 1
      true
    elsif [board[2], board[5], board[8]].uniq.size == 1
      true
    elsif [board[2], board[4], board[6]].uniq.size == 1
      true
    elsif [board[3], board[4], board[5]].uniq.size == 1
      true
    elsif [board[6], board[7], board[8]].uniq.size == 1
      true
    end
  end
end
