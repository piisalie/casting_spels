require_relative 'basic_item'
require_relative 'inventory'

module CastingSpels
  class Room < BasicItem
    def initialize(name, description, static_items, *items)
      super(name, description)
      @static_items = static_items
      @items        = { }
      @exits        = { }
      items.each do |item|
        @items[item.name.to_sym] = item
      end
    end
    
    include Inventory

    def add_exit(direction, room)
      @exits[direction] = room
    end

    attr_reader :exits
    
  end
end
