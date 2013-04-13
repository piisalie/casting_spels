module CastingSpels
  class BucketItem
    def initialize
      @full     = false
      @welded   = false
      @weldable = true
    end

    attr_reader :full, :welded, :weldable
    
    def weld
      @welded = true
    end

    def fill
      @full = true if @welded
    end

    def splash
      @full = false if @welded and @full
    end

    def to_s
      "bucket"
    end

    def inspect
      if !@full and !@welded
        "an empty bucket otherwise unattached"
      elsif !@full and @welded
        "an empty bucket welded to a chain"
      elsif @full and @welded
        "a bucket full of water attached to a chain"
      end
    end
  end
end
