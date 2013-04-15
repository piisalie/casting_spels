require_relative 'noun'
require_relative 'inventory'

module CastingSpels
  class Room < Noun
    def initialize(name, description, items,
                   static_items, exits)
      super(name, description)
      @exits        = exits
      @static_items = static_items
      @items        = items
    end
    include Inventory
  end
end
