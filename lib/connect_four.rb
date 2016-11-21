require_relative './player'
require_relative './board'
require_relative './game'

class Connect
  attr_accessor :game

  def initialize
    system "clear"
    @game = Game.new
    @game.welcome_message
    @game.request_names
    5.times do
      game_loop
    end
  end

  def game_loop
    system "clear"
    @game.welcome_message
    @game.board.print_board
    player_loop
  end

  def player_loop
    @game.add_turn
    current_move = ""
    begin
      @game.current_player.request_column
      current_move = @game.current_player.chosen_column
    end until @game.validate_column(current_move) == true
    @game.add_piece(current_move)
  end
end


x = Connect.new
