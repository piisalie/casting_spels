require_relative 'basic_item'
require_relative 'inventory'
require_relative 'actions'
require_relative 'look_action'

module CastingSpels
  class Room < BasicItem
    def initialize(name, description, static_items, *items)
      super(name, description)
      @static_items = static_items
      @items        = { }
      @exits        = { }
      @actions      = [ ]
      add_action(LookAction.new)
      items.each do |item|
        @items[item.name.to_sym] = item
      end
    end

    attr_reader :exits, :description
    include Inventory
    include Actions

    def add_exit(direction, room)
      @exits[direction] = room
    end    
  end
end
