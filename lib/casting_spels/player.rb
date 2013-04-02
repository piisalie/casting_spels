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

    def move(direction)
      if @location.move?(direction.to_sym)
        @location = @map[@location.move(direction.to_sym)]
        @location.look
      else
        "cannot move that way"
      end
    end

    def get(item)
      if @location.has?(item)
        @inventory[item.to_sym] = @location.take(item)
      else
        "Do you see a #{item}? I don't"
      end
    end

    def weld(*items)
    end

    def fill(item)
    end
  end
end
