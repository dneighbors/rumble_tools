require "spec_helper"

RSpec.describe RumbleTools::MiniTalent do
  describe ".talent_id_for" do
    it "calculates the correct talent ID for a mini ID and talent index" do
      expect(RumbleTools::MiniTalent.talent_id_for(RumbleTools::Mini::SYLVANAS, 0)).to eq(0x148)
      expect(RumbleTools::MiniTalent.talent_id_for(RumbleTools::Mini::SYLVANAS, 1)).to eq(0x149)
      expect(RumbleTools::MiniTalent.talent_id_for(RumbleTools::Mini::SYLVANAS, 2)).to eq(0x14a)
    end
  end

  describe ".mini_id_from_talent" do
    it "extracts the mini ID from a talent ID" do
      talent_id = RumbleTools::MiniTalent.talent_id_for(RumbleTools::Mini::SYLVANAS, 2)
      expect(RumbleTools::MiniTalent.mini_id_from_talent(talent_id)).to eq(RumbleTools::Mini::SYLVANAS)
    end
  end

  describe ".talent_index_from_talent" do
    it "extracts the talent index from a talent ID" do
      talent_id = RumbleTools::MiniTalent.talent_id_for(RumbleTools::Mini::SYLVANAS, 2)
      expect(RumbleTools::MiniTalent.talent_index_from_talent(talent_id)).to eq(2)
    end
  end

  describe ".name_for" do
    it "returns the name of a talent" do
      talent_id = RumbleTools::MiniTalent.talent_id_for(RumbleTools::Mini::DIRE_BATLINGS, 0)
      expect(RumbleTools::MiniTalent.name_for(talent_id)).to eq(:GUANO_HAPPENS)
    end

    it "returns nil for an unknown talent ID" do
      expect(RumbleTools::MiniTalent.name_for(999)).to be_nil
    end
  end

  describe ".talent_id_for_name" do
    it "returns the talent ID for a given name" do
      expect(RumbleTools::MiniTalent.talent_id_for_name(:GUANO_HAPPENS)).to eq(
        RumbleTools::MiniTalent.talent_id_for(RumbleTools::Mini::DIRE_BATLINGS, 0)
      )
    end

    it "returns nil for an unknown talent name" do
      expect(RumbleTools::MiniTalent.talent_id_for_name(:UNKNOWN_TALENT)).to be_nil
    end
  end
end 