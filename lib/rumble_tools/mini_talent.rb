module RumbleTools
  module MiniTalent
    # Talent calculations
    def self.talent_id_for(mini_id, talent_index)
      (mini_id << 2) + talent_index
    end

    def self.mini_id_from_talent(talent_id)
      talent_id >> 2
    end

    def self.talent_index_from_talent(talent_id)
      talent_id & 0x3
    end

    # Talent name mappings
    TALENT_NAMES = {
      # Angry Chickens
      talent_id_for(Mini::ANGRY_CHICKENS, 0) => :SNACKRIFICE,
      talent_id_for(Mini::ANGRY_CHICKENS, 1) => :WALKING_CRATE,
      talent_id_for(Mini::ANGRY_CHICKENS, 2) => :FURIOUS_FOWL,

      # Arcane Blast
      talent_id_for(Mini::ARCANE_BLAST, 0) => :AMPLIFICATION,
      talent_id_for(Mini::ARCANE_BLAST, 1) => :ARCANE_POWER,
      talent_id_for(Mini::ARCANE_BLAST, 2) => :TORRENT,

      # Blizzard
      talent_id_for(Mini::BLIZZARD, 0) => :COLDSNAP,
      talent_id_for(Mini::BLIZZARD, 1) => :ICECROWN,
      talent_id_for(Mini::BLIZZARD, 2) => :BRITTLE_ICE,

      # Chain Lightning
      talent_id_for(Mini::CHAIN_LIGHTNING, 0) => :BRILLIANT_FLASH,
      talent_id_for(Mini::CHAIN_LIGHTNING, 1) => :STORMS_REACH,
      talent_id_for(Mini::CHAIN_LIGHTNING, 2) => :REVERBERATION,

      # Cheat Death
      talent_id_for(Mini::CHEAT_DEATH, 0) => :SEAL_FATE,
      talent_id_for(Mini::CHEAT_DEATH, 1) => :VAMPIRISM,
      talent_id_for(Mini::CHEAT_DEATH, 2) => :APOCALYPSE,

      # Deep Breath
      talent_id_for(Mini::DEEP_BREATH, 0) => :ATTUNEMENT,
      talent_id_for(Mini::DEEP_BREATH, 1) => :MELTING_POINT,
      talent_id_for(Mini::DEEP_BREATH, 2) => :DOUBLE_DRAGON,

      # Earth And Moon
      talent_id_for(Mini::EARTH_AND_MOON, 0) => :MOONFURY,
      talent_id_for(Mini::EARTH_AND_MOON, 1) => :NATURES_GRACE,
      talent_id_for(Mini::EARTH_AND_MOON, 2) => :BALANCE,

      # Eclipse
      talent_id_for(Mini::ECLIPSE, 0) => :SOLAR_FLARE,
      talent_id_for(Mini::ECLIPSE, 1) => :UMBRAL_FORCE,
      talent_id_for(Mini::ECLIPSE, 2) => :CELESTIAL_FOCUS,

      # Dire Batlings
      talent_id_for(Mini::DIRE_BATLINGS, 0) => :GUANO_HAPPENS,
      talent_id_for(Mini::DIRE_BATLINGS, 1) => :SOUND_WAVE,
      talent_id_for(Mini::DIRE_BATLINGS, 2) => :VAMPIRE_BATS,

      # Ghoul
      talent_id_for(Mini::GHOUL, 0) => :TASTE_FOR_BLOOD,
      talent_id_for(Mini::GHOUL, 1) => :FEEDING_FRENZY,
      talent_id_for(Mini::GHOUL, 2) => :UNHOLY_FRENZY,

      # Necromancer
      talent_id_for(Mini::NECROMANCER, 0) => :MASTER_OF_DEATH,
      talent_id_for(Mini::NECROMANCER, 1) => :SKELETAL_SWARM,
      talent_id_for(Mini::NECROMANCER, 2) => :SKELETAL_LEGION,

      # Sylvanas
      talent_id_for(Mini::SYLVANAS, 0) => :BLACK_ARROW,
      talent_id_for(Mini::SYLVANAS, 1) => :MIND_CONTROL,
      talent_id_for(Mini::SYLVANAS, 2) => :WAIL_OF_THE_BANSHEE
    }

    # Helper methods
    def self.name_for(talent_id)
      TALENT_NAMES[talent_id]
    end

    def self.talent_id_for_name(name)
      TALENT_NAMES.key(name.to_sym)
    end
  end
end 