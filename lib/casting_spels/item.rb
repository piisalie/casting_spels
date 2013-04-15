require_relative 'noun'

module CastingSpels
  class Item < Noun
    def initialize(name, description,
                   weldable=false, can_hold_water=false )
      super(name, description)
      @weldable, @can_hold_water = weldable, can_hold_water
    end
  end
end
