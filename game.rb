# class Game takes care of things like displaying menu, starting a game

require_relative 'board'
require_relative 'player'

class Game
  attr_accessor :players, :board, :start_game

  def initialize(players, board_instance)
    @players = players
    @board = board_instance
    @start_game = false
  end

  def start_menu
    puts "\n-----Menu-----"
    puts '1. Show board'
    puts '2. Start game'
    puts '3. Exit'
    puts '--------------'
    puts "\nEnter your choice:"
    choice = gets.chomp.to_i
    start_menu_choice(choice)
  end

  def start_menu_choice(choice)
    case choice
    when 1
      @board.show_board
    when 2
      @start_game = true
    when 3
      exit 0
    end
  end

  def game_menu
    puts "\n-----Game Menu-----"
    puts '1. Play turn'
    puts '2. Show board'
    puts '3. Exit'
    puts '-----------'
    puts "\nEnter your choice:"
    choice = gets.chomp.to_i
    game_menu_choice(choice)
  end

  def game_menu_choice(choice)
    case choice
    when 1
      postion = play_turn(player_num)
    when 2
      @board.show_board
    when 3
      exit 0
    end
  end

  def play_turn
    puts "\n Enter your postion:"
    postion = gets.chomp.to_i
  end
end

puts 'Welcome to Tic-Tac-Toe'
board_instance = Board.new
players = Player.new
game1 = Game.new(players, board_instance)
players.display_player_selection
board_instance.show_board
game1.start_menu until game1.start_game == true
player_num = 0
loop do
  if board_instance.winning_condition(board_instance.board)
    Exit
  else
    puts "Player #{(player_num % 2) + 1}'s Turn"
    game1.game_menu
  end
end
