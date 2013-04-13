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

    def weld(item1, item2)
      if !@location.welder?
        puts "You need a welder to do that."
      elsif !@inventory[item1] or !@inventory[item2]
        puts "The items need to be in your inventory"
      elsif !@inventory[item1].weldable or !@inventory[item2].weldable
        puts "You wouldn't weld that!"
      else
        @inventory[:bucket].weld
        @inventory.delete(:chain)
        show_inventory
      end
    end

    def dunk(item)
      if !@location.well?
        puts "You'll need a well to do that."
      elsif !@inventory[item]
        puts "You cannot dunk something that's not in your inventory."
      elsif item != :bucket or !@inventory[item].welded
        puts "The well is too deep for that"
      else
        @inventory[item].fill
        show_inventory
      end
    end

    def splash(item1, item2)
      if item1 != :bucket or !@inventory[:bucket]
        puts "You should use a bucket to splash things."
      elsif !@inventory[:bucket].full
        puts "You wave a bucket around wildly in the direction of a #{item2}."
      elsif item2 != "wizard"
        puts "You splash your bucket on a #{item2}."
        @inventory[:bucket].splash
        show_inventory
      elsif !@location.wizard?
        puts "I see no wizard here."
      else
        @location.splash_wizard
      end
    end
  end
end
