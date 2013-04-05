module CastingSpels
  class Room
    
    def take(item)
      object = nil
      @items.each { |obj| object = obj if obj.to_s == item }
      @items.delete_if { |obj| obj.to_s == item } if object
      return object if object
    end

    def has_exit?(direction)
      @exits.include?(direction.to_sym)
    end

    def has_item?(item)
      @items.one? { |obj| obj.to_s == item }
    end

    def welder?
      false
    end

    def well?
      false
    end

  end
end
