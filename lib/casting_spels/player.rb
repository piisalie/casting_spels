require_relative "inventory"
require_relative "actions"

module CastingSpels
  class Player
    def initialize(starting_location)
      @items    = { }
      @actions  = [ ]
      @location = starting_location
    end
    attr_accessor :location
    include Inventory
    include Actions
  end
end
