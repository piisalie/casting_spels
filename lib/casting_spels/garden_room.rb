module CastingSpels
  class GardenRoom < Room
    def initialize
      @exits = [ :west ]
      @items = [ ChainItem.new, FrogItem.new ]
      @well  = true
    end

    def description
      "A sweet smelling garden with a deep well and a door to the west. Items: #{@items.join(", ")}"
    end
  end
end
