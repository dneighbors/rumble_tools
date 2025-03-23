require "spec_helper"

RSpec.describe RumbleTools::Loadout do
  describe "#initialize" do
    it "creates a loadout with default values" do
      loadout = RumbleTools::Loadout.new
      expect(loadout.leader).to be_a(RumbleTools::Leader)
      expect(loadout.troops).to eq([])
    end

    it "creates a loadout with a leader" do
      leader = RumbleTools::Leader.new(RumbleTools::Mini::SYLVANAS, 2)
      loadout = RumbleTools::Loadout.new(leader)
      expect(loadout.leader).to eq(leader)
      expect(loadout.troops).to eq([])
    end

    it "creates a loadout with a leader and troops" do
      leader = RumbleTools::Leader.new(RumbleTools::Mini::SYLVANAS, 2)
      troops = [
        RumbleTools::Troop.new(RumbleTools::Mini::DIRE_BATLINGS, 0),
        RumbleTools::Troop.new(RumbleTools::Mini::ANGRY_CHICKENS, 1)
      ]
      loadout = RumbleTools::Loadout.new(leader, troops)
      expect(loadout.leader).to eq(leader)
      expect(loadout.troops).to eq(troops)
    end
  end

  describe ".from_code and #to_code" do
    it "can parse a loadout code" do
      code = "rumblo:CEMQABoECCYQAhoECBUQABoECF0QARoECAkQABoECB4QABoECFYQAQ=="
      loadout = RumbleTools::Loadout.from_code(code)
      
      expect(loadout).to be_a(RumbleTools::Loadout)
      expect(loadout.leader).to be_a(RumbleTools::Leader)
      expect(loadout.troops.size).to be > 0
      expect(loadout.troops.first).to be_a(RumbleTools::Troop)
    end

    it "handles a code without the prefix" do
      code = "CEMQABoECCYQAhoECBUQABoECF0QARoECAkQABoECB4QABoECFYQAQ=="
      loadout = RumbleTools::Loadout.from_code(code)
      
      expect(loadout).to be_a(RumbleTools::Loadout)
    end

    it "generates a loadout code" do
      leader = RumbleTools::Leader.new(RumbleTools::Mini::SYLVANAS, 2)
      troops = [
        RumbleTools::Troop.new(RumbleTools::Mini::DIRE_BATLINGS, 0),
        RumbleTools::Troop.new(RumbleTools::Mini::ANGRY_CHICKENS, 1)
      ]
      loadout = RumbleTools::Loadout.new(leader, troops)
      
      code = loadout.to_code
      expect(code).to start_with("rumblo:")
      
      # Verify roundtrip
      decoded = RumbleTools::Loadout.from_code(code)
      expect(decoded.leader.mini).to eq(loadout.leader.mini)
      expect(decoded.leader.talent).to eq(loadout.leader.talent)
      expect(decoded.troops.size).to eq(loadout.troops.size)
      expect(decoded.troops.first.mini).to eq(loadout.troops.first.mini)
    end
  end

  describe "#to_h" do
    it "returns a hash representation" do
      leader = RumbleTools::Leader.new(RumbleTools::Mini::SYLVANAS, 2)
      troops = [
        RumbleTools::Troop.new(RumbleTools::Mini::DIRE_BATLINGS, 0),
        RumbleTools::Troop.new(RumbleTools::Mini::ANGRY_CHICKENS, 1)
      ]
      loadout = RumbleTools::Loadout.new(leader, troops)
      
      hash = loadout.to_h
      expect(hash[:leader]).to eq(leader.to_h)
      expect(hash[:troops].size).to eq(2)
      expect(hash[:troops][0]).to eq(troops[0].to_h)
      expect(hash[:troops][1]).to eq(troops[1].to_h)
    end
  end
end 