module CastingSpels
  class WalkAction
    def initialize(starting_location)
      @current_location = starting_location
    end

    def walk(direction)
      @current_location = @current_location.exits[direction]
    end
  end
end

  
