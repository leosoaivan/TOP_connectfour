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
    begin
      @game.current_player.request_column
      move = @game.current_player.chosen_column
    end until @game.validate_column(move) == true
  end

end

x = Connect.new
