class Board
  attr_accessor :c, :size

  def initialize
    @c = [
      [" ", " ", " ", " ", " ", " ", " "],
      [" ", " ", " ", " ", " ", " ", " "],
      [" ", " ", " ", " ", " ", " ", " "],
      [" ", " ", " ", " ", " ", " ", " "],
      [" ", " ", " ", " ", " ", " ", " "],
      [" ", " ", " ", " ", " ", " ", " "]
    ]
    @size = (@c.length * @c[1].length)
  end

  def print_board
    puts "    1   2   3   4   5   6   7 "
    puts "  +---+---+---+---+---+---+---+"
    (@c.length).times do |c|
      print "  |"
      @c[c].each { |elem| print "#{elem}  |" }
      puts
      puts "  +---+---+---+---+---+---+---+"
    end
    puts
  end

end
