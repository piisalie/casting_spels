module CastingSpels
  class GardenRoom < Room
    def initialize
      @exits = [ :west ]
      @items = [ ChainItem.new, FrogItem.new ]
      @well  = true
    end

    attr_reader :well

    def description
      "A sweet smelling garden with a deep well and a door to the west. Items: #{@items.join(", ")}"
    end

    def move(direction)
      case direction
      when "west"
        :living_room
      end
    end
  end
end
