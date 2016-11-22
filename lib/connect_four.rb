require_relative './player'
require_relative './board'
require_relative './game'

class Connect
  attr_accessor :game, :response

  def initialize
    system "clear"
    @game = Game.new
    @game.welcome_message
    @game.request_names
    game_loop
    game_results
    new_game
  end

  def game_loop
    begin
      screen_print
      player_loop
    end until @game.win? || (@game.turns == @game.board.size)
    screen_print
  end

  def screen_print
    system "clear"
    @game.welcome_message
    @game.board.print_board
  end

  def player_loop
    @game.add_turn
    current_move = nil
    begin
      @game.current_player.request_column
      current_move = @game.current_player.chosen_column
    end until @game.validate_column(current_move) == true
    @game.add_piece(current_move)
  end

  def game_results
    puts "#{@game.current_player.name} won in #{(@game.turns + 1) / 2} moves!"
    print "Would you like to play again? Y/N? "
    response = gets.chomp.downcase
    if response == "n"
      puts "Thanks for playing. Goodbye!"
      exit
    elsif response == "y"
      restart
    end
  end

  def restart
    x = Connect.new
  end

end

x = Connect.new
