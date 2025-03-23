module RumbleTools
  class MiniBase
    attr_accessor :mini, :talent_id

    def initialize(mini = nil, talent = nil)
      @mini = mini
      
      if talent.is_a?(Integer) && talent <= 2
        @talent_id = MiniTalent.talent_id_for(mini, talent)
      else
        @talent_id = talent
      end
    end

    def mini_name
      Mini.name_for(@mini)
    end

    def talent_name
      MiniTalent.name_for(@talent_id) if @talent_id
    end

    def talent
      @talent_id ? MiniTalent.talent_index_from_talent(@talent_id) : nil
    end
    
    def talent=(value)
      if value.nil?
        @talent_id = nil
      elsif value.is_a?(Integer) && value <= 2
        @talent_id = MiniTalent.talent_id_for(@mini, value)
      else
        @talent_id = value
      end
    end
    
    def to_h
      {
        mini: @mini,
        mini_name: mini_name,
        talent: talent,
        talent_name: talent_name,
        talent_id: @talent_id
      }
    end
    
    def to_json(*args)
      to_h.to_json(*args)
    end
  end
end 