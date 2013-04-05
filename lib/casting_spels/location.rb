module CastingSpels
  class Location
    def initialize
      @map              = { :living_room => LivingRoom.new,
                            :attic       => AtticRoom.new,
                            :garden      => GardenRoom.new }
      @current_location = @map[:living_room]
    end

    def look
      @current_location.description
    end

    def move(direction)
      if @current_location.has_exit?(direction.to_sym)
        exit(@current_location, direction)
      else
        puts "cannot move that way"
      end
    end

    def pickup(item, inventory)
      if @current_location.has?(item)
        inventory << @current_location.take(item)
      else
        puts "Do you see a #{item} here? I don't."
      end
    end

    def exit(location, direction)
      case location
      when @map[:living_room]
        living_room_exit(direction)
      when @map[:attic]
        attic_room_exit(direction)
      when @map[:garden]
        garden_room_exit(direction)
      end
    end

    def living_room_exit(direction)
      case direction
      when "upstairs"
        @current_location = @map[:attic]
      when "east"
        @current_location = @map[:garden]
      end
    end

    def attic_room_exit(direction)
      case direction
      when "downstairs"
        @current_location = @map[:living_room]
      end
    end

    def garden_room_exit(direction)
      case direction
      when "west"
        @current_location = @map[:living_room]
      end
    end
  end
end
