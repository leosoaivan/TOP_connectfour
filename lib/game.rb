require_relative './board'
require_relative './player'

class Game
  attr_accessor :board, :player1, :player2, :turns

  def initialize
    @board = Board.new
    @player1 = Player.new("Player 1", "\u{25EF} ")
    @player2 = Player.new("Player 2", "\u{2B24} ")
    @turns = 0
  end

  def request_names
    ary = [@player1, @player2]
    ary.each do |player|
      print "#{player.name}, customize your name: "
      player.name = gets.chomp
    end
  end

  def current_player
    @turns % 2 == 0 ? @player2 : @player1
  end

  def add_turn
    @turns += 1
  end

  def column_inbounds?(column)
    column.between?(0, @board.c[0].length - 1) ? true : false
  end

  def column_has_space?(column)
    @board.c[0][column].empty? ? true : false
  end

  def validate_column(column)
    if column_inbounds?(column) && column_has_space?(column)
      true
    else
      puts "That is not a valid column, or the column is full. Try again!"
      false
    end
  end

end
