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
      system "clear"
      puts "You splash the wizard..."
      sleep 2
      puts "... he wakes and give you a low carb donut!"
      puts "        _.-------._    "
      puts "      .'    ___    '.  "
      puts "     /     (___)     \\ "
      puts "     |'._         _.'| "
      puts "     |   `'-----'`   | "
      puts "      \\             /  "
      puts "       '-.______..-'   "
      puts "You Win!"
      exit
    end

    def exit(direction)
      case direction
      when "upstairs"
        :attic
      when "east"
        :garden
      end
    end
  end
end
