require 'base64'
require 'json'
require 'stringio'
require_relative 'loadout_pb'

module RumbleTools
  class Loadout
    attr_accessor :leader, :troops
    
    def initialize(leader = nil, troops = [])
      @leader = leader || Leader.new
      @troops = troops || []
    end
    
    # Parse a loadout code and return a loadout object
    def self.from_code(code)
      # Remove rumblo: prefix if present
      code = code.sub(/^rumblo:/, '')
      
      # Decode the base64 string
      bytes = Base64.strict_decode64(code)
      
      # Parse the protocol buffer message
      proto = LoadoutProto.decode(bytes)
      
      # Create a new loadout
      loadout = Loadout.new
      
      # Create the leader
      loadout.leader = Leader.new(proto.leader_id, proto.leader_talent_id)
      
      # Create the troops
      proto.troops.each do |troop_proto|
        loadout.troops << Troop.new(troop_proto.mini_id, troop_proto.talent_id)
      end
      
      loadout
    end
    
    # Generate a loadout code
    def to_code
      # Create a protocol buffer message
      proto = LoadoutProto.new(
        leader_id: @leader.mini,
        leader_talent_id: @leader.talent_id,
        troops: @troops.map { |troop| TroopProto.new(mini_id: troop.mini, talent_id: troop.talent_id) }
      )
      
      # Encode the message to binary
      bytes = LoadoutProto.encode(proto)
      
      # Return the base64 encoded string with rumblo: prefix
      "rumblo:" + Base64.strict_encode64(bytes)
    end
    
    # Convert to hash for serialization
    def to_h
      {
        leader: @leader.to_h,
        troops: @troops.map(&:to_h)
      }
    end
    
    # Convert to JSON
    def to_json(*args)
      to_h.to_json(*args)
    end
  end
end 