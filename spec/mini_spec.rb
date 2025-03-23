require "spec_helper"

RSpec.describe RumbleTools::Mini do
  describe "constants" do
    it "has the correct value for SYLVANAS" do
      expect(RumbleTools::Mini::SYLVANAS).to eq(0x52)
    end

    it "has the correct value for DIRE_BATLINGS" do
      expect(RumbleTools::Mini::DIRE_BATLINGS).to eq(0x1e)
    end

    it "has the correct value for ANGRY_CHICKENS" do
      expect(RumbleTools::Mini::ANGRY_CHICKENS).to eq(0x01)
    end
  end

  describe ".name_for" do
    it "returns the name for a given ID" do
      expect(RumbleTools::Mini.name_for(0x52)).to eq(:SYLVANAS)
    end

    it "returns nil for an unknown ID" do
      expect(RumbleTools::Mini.name_for(999)).to be_nil
    end
  end

  describe ".id_for" do
    it "returns the ID for a given name" do
      expect(RumbleTools::Mini.id_for(:SYLVANAS)).to eq(0x52)
      expect(RumbleTools::Mini.id_for("SYLVANAS")).to eq(0x52)
    end

    it "returns nil for an unknown name" do
      expect(RumbleTools::Mini.id_for(:UNKNOWN_MINI)).to be_nil
    end
  end
end 