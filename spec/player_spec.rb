require_relative '../lib/player'

describe Player do

  describe "attributes" do
    it "allows reading/writing to :marker" do
      subject.marker = "X"
      expect(subject.marker).to eq("X")
    end
  end

end
