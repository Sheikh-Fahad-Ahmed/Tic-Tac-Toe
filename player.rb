class Player
  attr_accessor :player1, :player2

  def initialize
    puts "\nPlayer 1 please choose your token ( X or O ):"
    @player1 = gets.chomp.upcase
    @player2 = if @player1 == 'X'
                 'O'
               else
                 'X'
               end
  end

  def display_player_selection
    puts "\nPlayer 1 : #{@player1}\nPlayer 2 : #{@player2}"
  end
end
