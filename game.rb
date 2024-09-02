# class Game takes care of things like displaying menu, starting a game

require_relative 'board'
require_relative 'player'

class Game
  def initialize(players, board_instance)
    @players = players
    @board = board_instance
    @@start_game = false
  end

  def display_menu
    puts "\n-----Menu-----"
    puts '1. Show board'
    puts @@start_game ? '2. pick your position' : '2. Start game'
    puts '3. Exit'
    puts '--------------'
    puts "\nEnter your choice:"
    choice = gets.chomp.to_i
    go_to_menu(choice)
  end

  def go_to_menu(choice)
    case choice
    when 1
      @board.show_board
    when 2
      if @@start_game == false
        @@start_game = true
      else
        'pick your position'
      end
    when 3
      exit 0
    end
  end
end

puts 'Welcome to Tic-Tac-Toe'
board_instance = Board.new
players = Player.new
game1 = Game.new(players, board_instance)
players.display_player_selection
board_instance.show_board
loop do
  if board_instance.winning_condition(board_instance.board)
    Exit
  else
    game1.display_menu
  end
end
