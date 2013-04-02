module CastingSpels
  class AtticRoom < Room
    def initialize
      @exits  = [ :downstairs ]
      @items  = [ ]
      @welder = true
    end

    attr_reader :welder
    
    def look
      "A musty attic, a welder sits against the wall and a staircase in the corner. Items: #{@items.join(", ")}"
    end
    
    def move(direction)
      case direction
      when :downstairs
        :living_room
      end
    end
  end
end
