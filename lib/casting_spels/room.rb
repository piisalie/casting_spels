require_relative 'basic_item'
require_relative 'inventory'

module CastingSpels
  class Room < BasicItem
    def initialize(name, description, static_items, *items)
      super(name, description)
      @static_items = static_items
      @items        = items
      @exits        = { }
    end
    include Inventory

    def add_exit(direction, room)
      @exits[direction] = room
    end

    attr_reader :exits
    
  end
end
