require_relative "inventory"

module CastingSpels
  class Player
    def initialize(location)
      @items    = { }
      @location = location
      @actions  = [ ]
    end
    include Inventory

    def add_action(action)
      @actions << action
    end
  end
end
