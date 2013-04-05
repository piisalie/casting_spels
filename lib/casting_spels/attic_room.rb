module CastingSpels
  class AtticRoom < Room
    def initialize
      @exits  = [ :downstairs ]
      @items  = [ ]
    end

    def description
      "A musty attic, a welder sits against the wall and a staircase in the corner. Items: #{@items.join(", ")}"
    end

    def welder?
      true
    end
  end
end
