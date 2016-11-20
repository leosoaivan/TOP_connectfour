class Player
  attr_accessor :name, :marker, :chosen_column

  def initialize(name = nil, marker = nil, column = nil)
    @name = name
    @marker = marker
    @chosen_column = column
  end

  def request_column
    print "#{@name}, where would you like to place your piece? "
    @chosen_column = gets.chomp.to_i - 1
  end

end
