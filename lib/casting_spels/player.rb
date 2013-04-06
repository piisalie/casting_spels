module CastingSpels
  class Player
    def initialize
      @map       = { :attic       => AtticRoom.new,
                     :living_room => LivingRoom.new,
                     :garden      => GardenRoom.new }
      @location  = @map[:living_room]
      @inventory = { }
    end

    attr_reader :inventory

    def look
      @location.describe
    end

    def walk(direction)
      if @location.has_exit?(direction)
        @location = @map[@location.move(direction)]
      else
        "cannot move that way"
      end
    end

    def pickup(item)
      if @location.has_item?(item)
        @inventory[item.to_sym] = @location.take(item)
      else
        "Do you see a #{item}? I don't."
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
              "You wouldn't weld that!"
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

    def dunk(item)
      if @location.well?
        if @inventory[item.to_sym]
          if item == "bucket" and @inventory[:bucket].welded
            @inventory[:bucket].fill
          else
            "The water is too low to do that."
          end
        else
          "You cannot dunk an item that's not in your inventory."
        end
      else
        "You'll need a well to do that."
      end
    end

    def splash
      if @location.wizard?
        if @inventory[:bucket]
          if @inventory[:bucket].full
            @location.splash_wizard
          else
            "Your bucket needs to be full."
          end
        else
          "You need a bucket to do that."
        end
      else
        "Don't waste water on things that aren't wizards!"
      end
    end
  end
end
