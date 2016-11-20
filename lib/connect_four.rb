require_relative './player'
require_relative './board'
require_relative './game'

class Connect
  attr_accessor :game

  def initialize
    @game = Game.new
    @game.request_names
    game_loop
  end

  def game_loop
    @game.add_turn
    current_move = ""
    begin
      @game.current_player.request_column
      current_move = @game.current_player.chosen_column
    end until @game.validate_column(current_move) == true
    find_empty_row(current_move)
    add_piece(current_move)
  end

end

x = Connect.new
