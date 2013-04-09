module CastingSpels
  class Player
    def initialize
      @map       = { :attic       => AtticRoom.new,
                     :living_room => LivingRoom.new,
                     :garden      => GardenRoom.new }
      @location  = @map[:living_room]
      @inventory = { }
    end

    def look
      puts @location.describe
    end

    def walk(direction)
      if @location.has_exit?(direction)
        @location = @map[@location.exit_room(direction)]
        look
      else
        puts "Cannot move that way."
        sleep 2
      end
    end

    def pickup(item)
      if @location.has_item?(item)
        @inventory[item.to_sym] = @location.take(item)
        show_inventory
      else
        puts "Do you see a #{item}? I don't."
      end
    end

    def show_inventory
      puts "Inventory:"
      @inventory.each do |key, value|
        puts "#{value}- #{value.inspect}"
      end
    end

    def weld(items)
      if items.length == 2
        if @location.welder?
          if @inventory[items[0].to_sym] and @inventory[items[1].to_sym]
            if items.include?("bucket") and items.include?("chain")
              @inventory.delete(:chain)
              @inventory[:bucket].weld
              show_inventory
            else
              puts "You wouldn't weld that!"
            end
          else
            puts "Both items need to be in your inventory."
          end
        else
          puts "You'll need a welder in order to weld."
        end
      else
        puts "You'll need two items in order to weld."
      end 
    end

    def dunk(item)
      if @location.well?
        if @inventory[item.to_sym]
          if item == "bucket" and @inventory[:bucket].welded
            @inventory[:bucket].fill
            show_inventory
          else
            puts "The water is too low to do that."
          end
        else
          puts "You cannot dunk an item that's not in your inventory."
        end
      else
        puts "You'll need a well to do that."
      end
    end

    def splash(items)
      if items.length == 2 and items[0] == "bucket" and @inventory[:bucket]
        if @inventory[:bucket].full
          if items[1] == "wizard" and @location.wizard?
            @location.splash_wizard
          else
            puts "You splash the #{items[1]}"
            @inventory[:bucket].splash
          end
        else
          puts "The bucket needs to be full before it can splash anything!"
        end
      else
        puts "You'll need a'bucket and a'object to go a'splashin.'"
      end
    end
  end
end
