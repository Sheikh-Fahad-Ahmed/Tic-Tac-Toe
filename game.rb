# class Game takes care of things like displaying menu, starting a game

require_relative 'board'
require_relative 'player'

class Game < Board
  def initialize
    super
    puts 'Welcome to Tic-Tac-Toe'
  end

  def display_menu
    puts "\n-----Menu-----"
    puts '1. Show board'
    puts '2. pick your position'
    puts '3. Exit'
    puts '--------------'
    puts "\nEnter your choice:"
    choice = gets.chomp.to_i
    go_to_menu(choice)
  end

  def go_to_menu(choice)
    case choice
    when 1
      show_board
    end
  end
end

game1 = Game.new

players = Player.new
players.display_player_selection
game1.display_menu
