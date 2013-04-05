module CastingSpels
  class LivingRoom < Room
    def initialize
      @exits  = [ :upstairs, :east ]
      @items  = [ BucketItem.new, WhiskeyBottleItem.new ]
      @wizard = true
    end

    def description
      "A quaint living room, excepting the wizard sprawled on the couch. There's a staircase in the corner and a door to the east. Items: #{@items.join(", ")}"
    end

    def move(direction)
      case direction
      when "upstairs"
        :attic
      when "east"
        :garden
      end
    end
  end
end
