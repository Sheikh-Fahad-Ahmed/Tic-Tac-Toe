# frozen_string_literal: true
# class Game takes care of things like displaying menu, starting a game

require_relative 'board'
require_relative 'player'

class Game
  attr_accessor :current_player

  def initialize
    @players = Player.new
    @board = Board.new
    @current_player = @players.get_player_choice
  end

  def start_game
    @players.display_player_selection
    game_menu
  end

  def check_winning_condition
    if @board.winning_condition == true
      winner_message
    elsif @board.winning_condition == 'draw'
      draw_message
    else
      false
    end
  end

  def game_menu
    game_menu_message
    choice = gets.chomp.to_i
    game_menu_choice(choice)
  end

  def play_turn
    until check_winning_condition
      @players.currently_playing(@current_player)
      @board.show_board
      update_board(get_position, @current_player)
      @current_player = @current_player == @players.player1 ? @players.player2 : @players.player1
    end
  end

  private

  attr_accessor :players, :board

  def get_position
    puts "\n Enter your position: "
    gets.chomp.to_i
  end

  def update_board(position, current_player)
    @board.board[position - 1] = current_player
  end

  def game_menu_choice(choice)
    case choice
    when 1
      play_turn
    when 2
      @board.show_board
    when 3
      exit 0
    end
  end

  def game_menu_message
    puts "\n-----Game Menu-----"
    puts '1. Start'
    puts '2. How to Play'
    puts '3. Exit'
    puts '--------------------'
    puts "\nEnter your choice:"
  end

  def winner_message
    message = <<~MESSAGE
      \n\n--------------------
      Congratulations!!!
      \nYou have won the game!
      Thank you for Playing!
      --------------------
    MESSAGE
    puts message
    exit 0
    message
  end

  def draw_message
    message = <<~MESSAGE
      \n\n--------------------
      \nWell, It's a DRAW...
      Better luck next time!!
      --------------------
    MESSAGE
    puts message
    exit 0
    message
  end
end
