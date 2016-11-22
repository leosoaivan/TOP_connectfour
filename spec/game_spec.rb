require 'game'

describe Game do

  describe "attributes" do
    it "creates an instance of Board" do
      expect(subject.board).to be_an_instance_of(Board)
    end
  end

  describe "#request_names" do
    it "sets a custom name for :player1" do
      allow(subject).to receive(:gets).and_return("Leo", "Michiko")
      subject.request_names
      expect(subject.player1.name).to eq("Leo")
    end
    it "sets a custom name for :player2" do
      allow(subject).to receive(:gets).and_return("Leo", "Michiko")
      subject.request_names
      expect(subject.player2.name).to eq("Michiko")
    end
  end

  describe "#current_player" do
    it "sets :player1 as the current player on odd turns" do
      subject.turns = 7
      expect(subject.current_player).to eq(subject.player1)
    end
  end

  describe "#add_turn" do
    it "adds a single turn" do
      subject.turns = 0
      subject.add_turn
      expect(subject.turns).to eq(1)
    end
  end

  describe "#validate_column" do
    it "returns true if the column can be played" do
      subject.board.c.first[6] = " "
      expect(subject.validate_column(6)).to be(true)
    end
    it "returns false if the column cannot be played" do
      subject.board.c.first[0] = "X"
      expect(subject.validate_column(0)).to be(false)
    end
  end

  describe "#find_empty_row" do
    it "returns the first empty row in a column" do
      subject.board.c[4][0] = "X"
      expect(subject.find_empty_row(0)).to eq(3)
    end
  end

  describe "#add_piece" do
    it "adds the current player's piece to the board" do
      subject = Game.new
      subject.current_player.marker = "X"
      subject.board.c[4][6] = "X"
      subject.add_piece(6)
      expect(subject.board.c[3][6]).to eq("X")
    end
  end

  describe "#vertical_win?" do
    it "returns true if 4 vertically-aligned markers match" do
      subject.board.c[0][6] = "X"
      subject.board.c[1][6] = "X"
      subject.board.c[2][6] = "X"
      subject.board.c[3][6] = "X"
      subject.row = 0
      subject.col = 6
      expect(subject.vertical_win?).to be(true)
    end
  end

  describe "#left_diag_win?" do
    it "returns true if 4 left-diagonally-aligned markers match" do
      subject.board.c[3][0] = "X"
      subject.board.c[2][1] = "X"
      subject.board.c[1][2] = "X"
      subject.board.c[0][3] = "X"
      subject.row = 0
      subject.col = 3
      expect(subject.left_diag_win?).to be(true)
    end
  end

  describe "#right_diag_win?" do
    it "returns true if 4 right-diagonally-aligned markers match" do
      subject.board.c[0][0] = "X"
      subject.board.c[1][1] = "X"
      subject.board.c[2][2] = "X"
      subject.board.c[3][3] = "X"
      subject.row = 0
      subject.col = 0
      expect(subject.right_diag_win?).to be(true)
    end
  end

  describe "#horizontal_win?" do
    it "returns true if 4 horizontally-aligned markers match" do
      subject.board.c[0][0] = "X"
      subject.board.c[0][1] = "X"
      subject.board.c[0][2] = "X"
      subject.board.c[0][3] = "X"
      subject.row = 0
      subject.col = 0
      expect(subject.horizontal_win?).to be(true)
    end
  end

end


# describe "#vertical_ary" do
#   it "returns an array of downward vertically-aligned pieces" do
#     subject.board.c[0][5] = "X"
#     subject.row = 0
#     subject.col = 5
#     expect(subject.vertical_ary).to eq(["X", " ", " ", " "])
#   end
#   it "returns nils if out of bound" do
#     subject.board.c[4][5] = "X"
#     subject.row = 4
#     subject.col = 5
#     expect(subject.vertical_ary).to eq(["X", " ", nil, nil])
#   end
# end
#
# describe "#right_diag_downcount" do
#   it "returns a count of right-down-diagonal matches" do
#     subject.board.c[0][0] = "X"
#     subject.board.c[1][1] = "X"
#     subject.board.c[2][2] = "X"
#     subject.board.c[3][3] = "X"
#     subject.row = 0
#     subject.col = 0
#     expect(subject.right_diag_downcount).to eq(3)
#   end
# end
#
# describe "left_diag_downcount" do
#   it "returns the sum of similar markers" do
#     subject.board.c[5][1] = "X"
#     subject.board.c[4][2] = "X"
#     subject.board.c[3][3] = "X"
#     subject.row = 3
#     subject.col = 3
#     expect(subject.left_diag_downcount).to eq(2)
#   end
# end
#
# describe "left_diag_upcount" do
#   it "returns the sum of similar markers" do
#     subject.board.c[0][0] = "X"
#     subject.board.c[1][1] = "X"
#     subject.board.c[2][2] = "X"
#     subject.board.c[3][3] = "X"
#     subject.row = 3
#     subject.col = 3
#     expect(subject.left_diag_upcount).to eq(3)
#   end
# end
