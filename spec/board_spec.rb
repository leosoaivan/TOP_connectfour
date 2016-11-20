require_relative '../lib/board'

describe Board do

  describe "attributes" do
    it "allows reading/writing to :c" do
      subject.c[0][0] = "X"
      expect(subject.c[0][0]).to eq("X")
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
      subject.c.last[0] = ""
      expect(subject.column_has_space?(0)).to be(true)
    end
  end

end
