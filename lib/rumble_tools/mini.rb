module RumbleTools
  module Mini
    # All mini deck code values in hex
    ANGRY_CHICKENS = 0x01
    ARCANE_BLAST = 0x02
    BLIZZARD = 0x03
    CHAIN_LIGHTNING = 0x04
    CHEAT_DEATH = 0x05
    DEEP_BREATH = 0x06
    EARTH_AND_MOON = 0x07
    ECLIPSE = 0x08
    EXECUTE = 0x09
    HOLY_NOVA = 0x0a
    LIVING_BOMB = 0x0b
    POLYMORPH = 0x0c
    SMOKE_BOMB = 0x0d
    ABOMINATION = 0x0e
    ANCIENT_OF_WAR = 0x0f
    ANUB_ARAK = 0x10
    BANSHEE = 0x11
    BARON_RIVENDARE = 0x12
    BAT_RIDER = 0x13
    BLOODMAGE_THALNOS = 0x14
    BOG_BEAST = 0x15
    CAIRNE_BLOODHOOF = 0x16
    CENARIUS = 0x17
    CHARLGA = 0x18
    CHIMAERA = 0x19
    CORE_HOUNDS = 0x1a
    DARK_IRON_MINER = 0x1b
    DARKSPEAR_TROLL = 0x1c
    DEFIAS_BANDITS = 0x1d
    DIRE_BATLINGS = 0x1e
    ORGRIM_DOOMHAMMER = 0x1f
    DRAKE = 0x20
    GENERAL_DRAKKISATH = 0x21
    DRUID_OF_THE_CLAW = 0x22
    DRYAD = 0x23
    EARTH_ELEMENTAL = 0x24
    EMPEROR_THAURISSAN = 0x25
    FAERIE_DRAGON = 0x26
    FIRE_ELEMENTAL = 0x27
    FIREHAMMER = 0x28
    FLAMEWAKER = 0x29
    GNOLL_BRUTE = 0x2d
    GROMMASH = 0x30
    HARPIES = 0x32
    FOOTMEN = 0x2a
    GARGOYLE = 0x2b
    GHOUL = 0x2c
    SAFE_PILOT = 0x2e
    GOBLIN_SAPPERS = 0x2f
    GRYPHON_RIDER = 0x31
    HARVEST_GOLEM = 0x33
    HEADLESS_HORSEMAN = 0x34
    HOGGER = 0x35
    HUNTRESS = 0x36
    JAINA = 0x37
    MAIEV = 0x38
    MALFURION = 0x39
    MEATWAGON = 0x3a
    MOLTEN_GIANT = 0x3b
    MOONKIN = 0x3c
    MOUNTAINEER = 0x3d
    MURLOC_TIDEHUNTERS = 0x3f
    NECROMANCER = 0x40
    OGRE_MAGE = 0x41
    OLD_MURKEYE = 0x42
    ONU = 0x43
    PLAGUE_FARMER = 0x44
    PROWLER = 0x45
    PYROMANCER = 0x46
    QUILLBOAR = 0x47
    RAGNAROS = 0x48
    RAPTORS = 0x49
    REND_BLACKHAND = 0x4a
    SHAMAN = 0x4b
    SKELETON_PARTY = 0x4c
    SKELETONS = 0x4d
    SNEED = 0x4e
    SPIDERLINGS = 0x4f
    STONEHOOF_TAUREN = 0x50
    SWOLE_TROLL = 0x51
    SYLVANAS = 0x52
    TIRION = 0x53
    TREANTS = 0x54
    VULTURES = 0x55
    WARSONG_GRUNTS = 0x56
    WARSONG_RAIDER = 0x57
    WHELPS = 0x58
    WITCH_DOCTOR = 0x59
    WORGEN = 0x5a
    YSERA = 0x5b
    PRIESTESS = 0x5d

    # Helper methods
    def self.name_for(id)
      constants.find { |const| const_get(const) == id }
    end

    def self.id_for(name)
      const_get(name.to_s.upcase)
    rescue NameError
      nil
    end
  end
end 