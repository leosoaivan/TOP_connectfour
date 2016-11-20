class Board
  attr_accessor :c, :column

  def initialize
    @c = [
      ["", "", "", "", "", "", ""],
      ["", "", "", "", "", "", ""],
      ["", "", "", "", "", "", ""],
      ["", "", "", "", "", "", ""],
      ["", "", "", "", "", "", ""],
      ["", "", "", "", "", "", ""]
    ]
  end

  def request_column
    print "Where would you like to place your piece? "
    column = gets.chomp.to_i - 1
  end

  def column_inbounds?(column)
    column.between?(0, @c[0].length) ? true : false
  end

  def column_has_space?(column)
    @c.last[column].empty? ? true : false
  end


  def self.won?
  end

end
