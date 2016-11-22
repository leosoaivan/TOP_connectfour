require_relative './board'
require_relative './player'
require 'pry'

class Game
  attr_accessor :board, :player1, :player2, :turns, :row, :col

  def initialize
    @board = Board.new
    @player1 = Player.new("Player 1", "\u{25EF}")
    @player2 = Player.new("Player 2", "\u{2B24}")
    @current_player = nil
    @turns = 0
    @row = 0
    @col = 0
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
    row = 0
    until row == @board.c.length - 1
      if (/\s+/ =~ @board.c[row + 1][column]) == 0
        row += 1
      else
        break
      end
    end
    row
  end

  def add_piece(column)
    row = find_empty_row(column)
    @board.c[row][column] = @current_player.marker
    @row = row
    @col = column
  end

  def win?
    (vertical_win? || horizontal_win?) || (right_diag_win? || left_diag_win?)
  end

  def vertical_win?
    vertical_ary.uniq.length == 1 ? true : false
  end

  def right_diag_win?
    right_diag_downcount + left_diag_upcount >= 3 ? true : false
  end

  def left_diag_win?
    left_diag_downcount + right_diag_upcount >= 3 ? true : false
  end

  def horizontal_win?
    left_count + right_count >= 3 ? true : false
  end

  private

  def column_inbounds?(column)
    column.between?(0, @board.c[0].length - 1) ? true : false
  end

  def column_has_space?(column)
    (/\s+/ =~ @board.c[0][column]) == 0 ? true : false
  end

  def vertical_ary
    vert_ary = []
    (0..3).each do |count|
      if @board.c[@row + count].nil?
        vert_ary << nil
      else
        vert_ary << @board.c[@row + count][@col]
      end
    end
    vert_ary
  end

  def right_diag_downcount
    same = 0
    (1..3).each do |shift|
      if @board.c[@row + shift].nil? || @board.c[@row][@col].nil?
        break
      elsif @board.c[@row][@col] == @board.c[@row + shift][@col + shift]
        same += 1
      else
        break
      end
    end
    same
  end

  def right_diag_upcount
    same = 0
    (1..3).each do |shift|
      if @board.c[@row - shift].nil? || @board.c[@row][@col].nil?
        break
      elsif @board.c[@row][@col] == @board.c[@row - shift][@col + shift]
        same += 1
      else
        break
      end
    end
    same
  end

  def left_diag_downcount
    same = 0
    (1..3).each do |shift|
      if @board.c[@row + shift].nil? || @board.c[@row][@col].nil?
        break
      elsif @board.c[@row][@col] == @board.c[@row + shift][@col - shift]
        same += 1
      else
        break
      end
    end
    same
  end

  def left_diag_upcount
    same = 0
    (1..3).each do |shift|
      if @board.c[@row - shift].nil? || @board.c[@row][@col].nil?
        break
      elsif @board.c[@row][@col] == @board.c[@row - shift][@col - shift]
        same += 1
      else
        break
      end
    end
    same
  end

  def left_count
    same = 0
    (1..3).each do |shift|
      @board.c[@row][@col] == @board.c[@row][@col - shift] ? same += 1 : break
    end
    same
  end

  def right_count
    same = 0
    (1..3).each do |shift|
      @board.c[@row][@col] == @board.c[@row][@col + shift] ? same += 1 : break
    end
    same
  end

end
