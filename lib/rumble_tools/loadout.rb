require 'base64'
require 'json'
require 'stringio'

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
      io = StringIO.new(bytes)
      
      # Create a new loadout
      loadout = Loadout.new
      
      # Read the leader ID
      leader_id = read_varint(io)
      leader_talent_id = read_varint(io) if io.pos < io.size
      
      # Create the leader
      loadout.leader = Leader.new(leader_id, leader_talent_id)
      
      # Read troops
      while io.pos < io.size
        # Read troop ID and talent ID
        troop_id = read_varint(io)
        troop_talent_id = read_varint(io) if io.pos < io.size
        
        # Create the troop and add it to the loadout
        loadout.troops << Troop.new(troop_id, troop_talent_id)
      end
      
      loadout
    end
    
    # Generate a loadout code
    def to_code
      io = StringIO.new
      
      # Write leader ID and talent ID
      write_varint(io, @leader.mini) if @leader.mini
      write_varint(io, @leader.talent_id) if @leader.talent_id
      
      # Write troops
      @troops.each do |troop|
        write_varint(io, troop.mini) if troop.mini
        write_varint(io, troop.talent_id) if troop.talent_id
      end
      
      # Return the base64 encoded string with rumblo: prefix
      "rumblo:" + Base64.strict_encode64(io.string)
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
    
    private
    
    # Read a variable-length integer from the stream
    def self.read_varint(io)
      value = 0
      shift = 0
      
      loop do
        byte = io.getbyte
        return nil if byte.nil?
        
        value |= (byte & 0x7F) << shift
        break if (byte & 0x80) == 0
        shift += 7
      end
      
      value
    end
    
    # Write a variable-length integer to the stream
    def write_varint(io, value)
      loop do
        byte = value & 0x7F
        value >>= 7
        
        if value.zero?
          io.putc(byte)
          break
        else
          io.putc(byte | 0x80)
        end
      end
    end
  end
end 