require "spec_helper"

RSpec.describe RumbleTools::Leader do
  it "inherits from MiniBase" do
    expect(RumbleTools::Leader.new).to be_a(RumbleTools::MiniBase)
  end

  it "initializes with mini and talent" do
    leader = RumbleTools::Leader.new(RumbleTools::Mini::SYLVANAS, 2)
    expect(leader.mini).to eq(RumbleTools::Mini::SYLVANAS)
    expect(leader.talent).to eq(2)
  end
end

RSpec.describe RumbleTools::Troop do
  it "inherits from MiniBase" do
    expect(RumbleTools::Troop.new).to be_a(RumbleTools::MiniBase)
  end

  it "initializes with mini and talent" do
    troop = RumbleTools::Troop.new(RumbleTools::Mini::DIRE_BATLINGS, 0)
    expect(troop.mini).to eq(RumbleTools::Mini::DIRE_BATLINGS)
    expect(troop.talent).to eq(0)
  end
end 