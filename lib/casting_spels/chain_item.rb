module CastingSpels
  class ChainItem
    def initialize
      @welded = false
    end

    def weld
      @welded = true
    end

    def inspect
      if @welded
        "a welded chain"
      else
        "an old chain"
      end
    end

    def to_s
      "chain"
    end
  end
end
