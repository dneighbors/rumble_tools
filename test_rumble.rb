#!/usr/bin/env ruby

# Simple test for RumbleTools

module RumbleTools
  module Mini
    SYLVANAS = 0x52
    DIRE_BATLINGS = 0x1e
  end
  
  module MiniTalent
    def self.talent_id_for(mini_id, talent_index)
      (mini_id << 2) + talent_index
    end
  end
  
  class MiniBase
    attr_accessor :mini, :talent_id
    
    def initialize(mini = nil, talent = nil)
      @mini = mini
      @talent_id = talent
    end
  end
  
  class Leader < MiniBase
  end
  
  class Troop < MiniBase
  end
  
  class Loadout
    attr_accessor :leader, :troops
    
    def initialize(leader = nil, troops = [])
      @leader = leader || Leader.new
      @troops = troops || []
    end
    
    def to_s
      "Loadout with #{@leader.mini.to_s(16)} leader and #{@troops.size} troops"
    end
  end
end

# Create a sample loadout
leader = RumbleTools::Leader.new(RumbleTools::Mini::SYLVANAS, 2)
loadout = RumbleTools::Loadout.new(leader)
loadout.troops = [
  RumbleTools::Troop.new(RumbleTools::Mini::DIRE_BATLINGS, 0)
]

puts "Created: #{loadout}"
puts "Leader mini: 0x#{loadout.leader.mini.to_s(16)}"
puts "First troop mini: 0x#{loadout.troops.first.mini.to_s(16)}" 