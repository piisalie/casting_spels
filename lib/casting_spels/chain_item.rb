module CastingSpels
  class ChainItem
    def initialize
      @weldable = true
    end

    attr_reader :weldable

    def inspect
      "an old chain"
    end

    def to_s
      "chain"
    end
  end
end
