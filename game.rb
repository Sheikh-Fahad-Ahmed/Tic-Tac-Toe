# class Game takes care of things like displaying menu, starting a game

require_relative 'board'
require_relative 'player'

class Game
  def initialize(players, board_instance)
    @players = players
    @board = board_instance
    @start_game = false
  end

  def game_menu(player_num)
    puts "\n-----Game Menu-----"
    puts '1. Play turn'
    puts '2. Show board'
    puts '3. Exit'
    puts '--------------------'
    puts "\nEnter your choice:"
    choice = gets.chomp.to_i
    game_menu_choice(choice, player_num)
  end

  private

  attr_accessor :players, :board, :start_game

  def update_board(postion, player_num)
    @board.board[postion - 1] = if player_num.even?
                                  @players.player1
                                else
                                  @players.player2
                                end
  end

  def play_turn(player_num)
    puts "\n Enter your postion:"
    postion = gets.chomp.to_i
    update_board(postion, player_num)
  end

  def game_menu_choice(choice, player_num)
    case choice
    when 1
      @board.show_board
      play_turn(player_num)
      player_num += 1
    when 2
      @board.show_board
      player_num
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
puts "\nDo you want to start the game (y or n):"
answer = gets.chomp.downcase
exit 0 if answer == 'n'
player_num = 0
loop do
  if board_instance.winning_condition(board_instance.board) == true
    puts "\n\n--------------------"
    puts 'Congradulations!!!'
    puts "\nYou has won the game!"
    puts 'Thank you for Playing!'
    puts '--------------------'
    exit 0
  elsif board_instance.winning_condition(board_instance.board) == 'draw'
    puts "\n\n--------------------"
    puts "\nWell, It's a DRAW..."
    puts 'Better luck next time!!'
    puts '--------------------'
    exit 0
  else
    puts "\nPlayer #{(player_num % 2) + 1}'s Turn"
    player_num = game1.game_menu(player_num)
  end
end
