require 'player.rb'

describe Player do

  describe "#new" do
    it "creates an instance of Player" do
      expect(subject).to be_an_instance_of(Player)
    end
  end

end
