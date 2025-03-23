#!/usr/bin/env ruby
# Example usage of the RumbleTools library

$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'rumble_tools'
require 'json'

include RumbleTools

# Example 1: Import a loadout from a code
puts "=== Importing Loadout ==="
imported_loadout = Loadout.from_code("rumblo:CEMQABoECCYQAhoECBUQABoECF0QARoECAkQABoECB4QABoECFYQAQ==")
puts JSON.pretty_generate(imported_loadout.to_h)
puts

# Example 2: Create a loadout from scratch
puts "=== Creating a New Loadout ==="
# Create a loadout with Sylvanas as leader
leader = Leader.new(Mini::SYLVANAS, 2) # Using talent index 2 (WAIL_OF_THE_BANSHEE)
created_loadout = Loadout.new(leader)

# Add troops to the loadout
created_loadout.troops = [
  Troop.new(Mini::DIRE_BATLINGS, MiniTalent.talent_id_for(Mini::DIRE_BATLINGS, 0)), # GUANO_HAPPENS
  Troop.new(Mini::ANGRY_CHICKENS, 1), # WALKING_CRATE (using index)
  Troop.new(Mini::GHOUL, 0), # TASTE_FOR_BLOOD
  Troop.new(Mini::DEEP_BREATH, 1), # MELTING_POINT
  Troop.new(Mini::CHAIN_LIGHTNING, 2), # REVERBERATION
  Troop.new(Mini::NECROMANCER, 0) # MASTER_OF_DEATH
]

puts "Troop talents:"
created_loadout.troops.each do |troop|
  puts "- #{troop.mini_name}: #{troop.talent_name}"
end
puts

# Generate a loadout code
created_loadout_code = created_loadout.to_code
puts "Loadout code: #{created_loadout_code}"

# Verify by importing the code again
puts
puts "=== Verification ==="
reimported_loadout = Loadout.from_code(created_loadout_code)
puts JSON.pretty_generate(reimported_loadout.to_h) 