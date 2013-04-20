require_relative 'basic_item'

module CastingSpels
  class WeldAction
    def initialize(player)
      @player = player
    end

    attr_writer :parent

    def handle?(command)
      return true if command[0] == "weld"
    end

    def process(command)
      if in_inventory?(command)
        @player.drop("bucket")
        @player.drop("chain")
        @player.take(BasicItem.new("welded_bucket", "a bucket welded to a chain"))
      end
    end
    
    def in_inventory?(command)
      if @player.show_inventory.include?(command[1].to_sym) and
          @player.show_inventory.include?(command[2].to_sym)
        return true
      else
        puts "Items need to be in your inventory."
      end
    end
  end
end
