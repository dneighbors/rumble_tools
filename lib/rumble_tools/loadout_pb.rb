require 'google/protobuf'

Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("lib/rumble_tools/loadout.proto", :syntax => :proto3) do
    add_message "rumble_tools.LoadoutProto" do
      optional :leader_id, :int32, 1
      optional :leader_talent_id, :int32, 2
      repeated :troops, :message, 3, "rumble_tools.TroopProto"
    end
    add_message "rumble_tools.TroopProto" do
      optional :mini_id, :int32, 1
      optional :talent_id, :int32, 2
    end
  end
end

module RumbleTools
  LoadoutProto = Google::Protobuf::DescriptorPool.generated_pool.lookup("rumble_tools.LoadoutProto").msgclass
  TroopProto = Google::Protobuf::DescriptorPool.generated_pool.lookup("rumble_tools.TroopProto").msgclass
end 