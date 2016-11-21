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
      column = 6
      subject.board.c[5][column] = "X"
      expect(subject.find_empty_row(column)).to eq(4)
    end
  end

  describe "#add_piece" do
    before (:context) do
      @game = Game.new
      @game.current_player.marker = "X"
      @game.board.c[4][6] = "X"
      @game.add_piece(6)
    end

    it "adds the current player's piece to the board" do
      expect(@game.board.c[3][6]).to eq("X")
    end
    it "returns the coordinates of the last move" do
      expect(@game.last_move).to eq([3, 6])
    end
  end

  describe "#vertical_win?" do
    it "returns true if 4 vertically-aligned markers match" do
      subject.board.c[0][6] = "X"
      subject.board.c[1][6] = "X"
      subject.board.c[2][6] = "X"
      subject.board.c[3][6] = "X"
      subject.last_move = [0, 6]
      expect(subject.vertical_win?).to be(true)
    end
  end

  describe "#right_diag_win?" do
    it "returns true if 4 right-diagonally-aligned markers match" do
      subject.board.c[0][0] = "X"
      subject.board.c[1][1] = "O"
      subject.board.c[2][2] = "X"
      subject.board.c[3][3] = "X"
      subject.last_move = [0, 0]
      expect(subject.right_diag_win?).to be(true)
    end
  end

end
