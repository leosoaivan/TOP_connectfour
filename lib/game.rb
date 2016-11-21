require_relative './board'
require_relative './player'
require 'pry'

class Game
  attr_accessor :board, :player1, :player2, :turns, :last_move

  def initialize
    @board = Board.new
    @player1 = Player.new("Player 1", "\u{25EF}")
    @player2 = Player.new("Player 2", "\u{2B24}")
    @current_player = nil
    @turns = 0
    @last_move = []
  end

  def welcome_message
    puts "*********************************************************************"
    puts "*                          CONNECT FOUR                             *"
    puts "*                                                                   *"
    puts "*      Welcome to a command line implementation of Connect          *"
    puts "*   Four! Your goal is to get 4 of your pieces in a row, in any     *"
    puts "*                      direction. Have fun!                         *"
    puts "*********************************************************************"
    puts
  end

  def request_names
    ary = [@player1, @player2]
    ary.each do |player|
      print "#{player.name}, customize your name: "
      player.name = gets.chomp
    end
  end

  def current_player
    @turns % 2 == 0 ? @current_player = @player2 : @current_player = @player1
  end

  def add_turn
    @turns += 1
  end

  def validate_column(column)
    if column_inbounds?(column) && column_has_space?(column)
      true
    else
      puts "That is not a valid column, or the column is full. Try again!"
      false
    end
  end

  def find_empty_row(column)
    (@board.c.length - 1).times do |row|
      if (/\s+/ =~ @board.c[row + 1][column]) == 0
        next
      else
        return row
      end
    end
  end

  def add_piece(column)
    row = find_empty_row(column)
    @board.c[row][column] = @current_player.marker
    @last_move = [row, column]
  end

  def vertical_win?
    vertical_ary.uniq.length == 1 ? true : false
  end

  def right_diag_win?
    right_diag_upcount + right_diag_downcount >= 3 ? true : false
  end

  private

  def column_inbounds?(column)
    column.between?(0, @board.c[0].length - 1) ? true : false
  end

  def column_has_space?(column)
    (/\s+/ =~ @board.c[0][column]) == 0 ? true : false
  end

  def vertical_ary
    row, column = @last_move[0], @last_move[1]
    vert_ary = []
    (0..3).each do |count|
      vert_ary << @board.c[row + count][column]
    end
    vert_ary
  end

  def right_diag_downcount
    row, column = @last_move[0], @last_move[1]
    same = 0
    3.times do |shift|
      if @board.c[row][column] == @board.c[row + shift][column + shift]
        same += 1
      else
        break
      end
    end
    same
  end

  def right_diag_upcount
    row, column = @last_move[0], @last_move[1]
    same = 0
    3.times do |shift|
      if @board.c[row][column] == @board.c[row - shift][column - shift]
        same += 1
      else
        break
      end
    end
    same
  end

end
