require_relative '../lib/player'

describe Player do

  let (:player) { Player.new("Leo", "X") }

  describe "attributes" do
    it "allows reading/writing to :name" do
      expect(player.name).to eq("Leo")
    end

    it "allows reading/writing to :marker" do
      expect(player.marker).to eq("X")
    end

    it "allows :chosen_column to be optional" do
      expect(player.chosen_column).to eq(nil)
    end
  end

  describe "request_column" do
    it "obtains and sets a possible column" do
      allow(subject).to receive(:gets).and_return("5")
      subject.request_column
      expect(subject.chosen_column).to eq(4)
    end
  end

end
