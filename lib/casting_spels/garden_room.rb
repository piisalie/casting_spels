module CastingSpels
  class GardenRoom < Room
    def initialize
      @exits = [ :west ]
      @items = { :chain => ChainItem.new, :frog => FrogItem.new }
    end

    def describe
      "A sweet smelling garden with a deep well and a door to the west. Items: #{@items.values.join(", ")}"
    end

    def well?
      true
    end

    def exit(direction)
      case direction
      when "west"
        :living_room
      end
    end
  end
end
