module CastingSpels
  class AtticRoom < Room
    def initialize
      @exits  = [ :downstairs ]
      @items  = { }
    end

    def describe
      "A musty attic, a welder sits against the wall and a staircase in the corner. Items: #{@items.values.join(", ")}"
    end

    def welder?
      true
    end
    
    def exit(direction)
      case direction
      when "downstairs"
        :living_room
      end
    end
  end
end
