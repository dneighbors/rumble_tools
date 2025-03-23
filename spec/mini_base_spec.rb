require "spec_helper"

RSpec.describe RumbleTools::MiniBase do
  describe "#initialize" do
    it "sets mini and talent_id" do
      mini_base = RumbleTools::MiniBase.new(RumbleTools::Mini::SYLVANAS, 2)
      expect(mini_base.mini).to eq(RumbleTools::Mini::SYLVANAS)
      expect(mini_base.talent_id).to eq(RumbleTools::MiniTalent.talent_id_for(RumbleTools::Mini::SYLVANAS, 2))
    end

    it "handles nil values" do
      mini_base = RumbleTools::MiniBase.new
      expect(mini_base.mini).to be_nil
      expect(mini_base.talent_id).to be_nil
    end

    it "accepts a direct talent_id" do
      talent_id = RumbleTools::MiniTalent.talent_id_for(RumbleTools::Mini::SYLVANAS, 2)
      mini_base = RumbleTools::MiniBase.new(RumbleTools::Mini::SYLVANAS, talent_id)
      expect(mini_base.talent_id).to eq(talent_id)
    end
  end

  describe "#mini_name" do
    it "returns the name of the mini" do
      mini_base = RumbleTools::MiniBase.new(RumbleTools::Mini::SYLVANAS)
      expect(mini_base.mini_name).to eq(:SYLVANAS)
    end

    it "returns nil for an unknown mini" do
      mini_base = RumbleTools::MiniBase.new(999)
      expect(mini_base.mini_name).to be_nil
    end
  end

  describe "#talent_name" do
    it "returns the name of the talent" do
      mini_base = RumbleTools::MiniBase.new(RumbleTools::Mini::DIRE_BATLINGS, 0)
      expect(mini_base.talent_name).to eq(:GUANO_HAPPENS)
    end

    it "returns nil for nil talent_id" do
      mini_base = RumbleTools::MiniBase.new(RumbleTools::Mini::SYLVANAS)
      expect(mini_base.talent_name).to be_nil
    end
  end

  describe "#talent" do
    it "returns the talent index" do
      mini_base = RumbleTools::MiniBase.new(RumbleTools::Mini::SYLVANAS, 2)
      expect(mini_base.talent).to eq(2)
    end

    it "returns nil for nil talent_id" do
      mini_base = RumbleTools::MiniBase.new(RumbleTools::Mini::SYLVANAS)
      expect(mini_base.talent).to be_nil
    end
  end

  describe "#talent=" do
    it "sets the talent_id based on the index" do
      mini_base = RumbleTools::MiniBase.new(RumbleTools::Mini::SYLVANAS)
      mini_base.talent = 2
      expect(mini_base.talent_id).to eq(RumbleTools::MiniTalent.talent_id_for(RumbleTools::Mini::SYLVANAS, 2))
    end

    it "handles nil" do
      mini_base = RumbleTools::MiniBase.new(RumbleTools::Mini::SYLVANAS, 2)
      mini_base.talent = nil
      expect(mini_base.talent_id).to be_nil
    end

    it "accepts a direct talent_id" do
      mini_base = RumbleTools::MiniBase.new(RumbleTools::Mini::SYLVANAS)
      talent_id = RumbleTools::MiniTalent.talent_id_for(RumbleTools::Mini::DIRE_BATLINGS, 0)
      mini_base.talent = talent_id
      expect(mini_base.talent_id).to eq(talent_id)
    end
  end

  describe "#to_h" do
    it "returns a hash representation" do
      mini_base = RumbleTools::MiniBase.new(RumbleTools::Mini::SYLVANAS, 2)
      hash = mini_base.to_h
      expect(hash[:mini]).to eq(RumbleTools::Mini::SYLVANAS)
      expect(hash[:mini_name]).to eq(:SYLVANAS)
      expect(hash[:talent]).to eq(2)
      expect(hash[:talent_name]).to eq(:WAIL_OF_THE_BANSHEE)
      expect(hash[:talent_id]).to eq(RumbleTools::MiniTalent.talent_id_for(RumbleTools::Mini::SYLVANAS, 2))
    end
  end
end 