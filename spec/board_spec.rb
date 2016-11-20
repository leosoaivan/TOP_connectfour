require_relative '../lib/board'

describe Board do

  describe "attributes" do
    it "allows reading/writing to :c" do
      subject.c[0][0] = "X"
      expect(subject.c[0][0]).to eq("X")
    end
  end

end
