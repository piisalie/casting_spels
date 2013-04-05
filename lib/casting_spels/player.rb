module CastingSpels
  class Player
    def initialize
      @map       = { :attic       => AtticRoom.new,
                     :living_room => LivingRoom.new,
                     :garden      => GardenRoom.new }
      @location  = @map[:living_room]
      @inventory = { }
    end

    attr_reader :location, :inventory

    def walk(direction)
      if @location.has_exit?(direction)
        @location = @map[@location.move(direction)]
        puts @location.description
      else
        "cannot move that way"
      end
    end

    def pickup(item)
      if @location.has_item?(item)
        @inventory[item.to_sym] = @location.take(item)
      else
        "Do you see a #{item}? I don't"
      end
    end

    def weld(*items)
      if items.length == 2
        if @location.welder?
          if @inventory[items[0].to_sym] and @inventory[items[1].to_sym]
            if items.include?("bucket") and items.include?("chain")
              @inventory.delete(:chain)
              @inventory[:bucket].weld
            else
              "You wouldn't weld that"
            end
          else
            "Both items need to be in your inventory."
          end
        else
          "You'll need a welder in order to weld."
        end
      else
        "You'll need two items in order to weld."
      end 
    end

    def fill(item)
    end
  end
end
