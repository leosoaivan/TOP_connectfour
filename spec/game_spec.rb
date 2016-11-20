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

  describe "#column_inbounds?" do
    it "returns true if the column in within bounds" do
      c = 6
      expect(subject.column_inbounds?(c)).to be(true)
    end
  end

  describe "#column_has_space?" do
    it "returns true if the column still has space" do
      subject.board.c.first[0] = ""
      expect(subject.column_has_space?(0)).to be(true)
    end
  end

  describe "#validate_column" do
    it "returns true if the column can be played" do
      expect(subject.validate_column(6)).to be(true)
    end
    it "returns false if the column cannot be played" do
      subject.board.c.first[0] = "X"
      expect(subject.validate_column(0)).to be(false)
    end
  end

end
