module CastingSpels
  class LivingRoom < Room
    def initialize
      @exits  = [ :upstairs, :east ]
      @items  = { :bucket => BucketItem.new, :bottle => WhiskeyBottleItem.new }
    end

    def describe
      "A quaint living room, excepting the wizard sprawled on the couch. There's a staircase in the corner and a door to the east. Items: #{@items.values.join(", ")}"
    end

    def wizard?
      true
    end

    def splash_wizard
      "you win"
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
