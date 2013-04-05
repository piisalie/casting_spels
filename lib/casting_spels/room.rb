module CastingSpels
  class Room

    def take(item)
      object = @items[item.to_sym]
      @items.delete(item.to_sym)
      return object
    end

    def has_exit?(direction)
      @exits.include?(direction.to_sym)
    end

    def has_item?(item)
      @items.has_key?(item.to_sym)
    end

    def welder?
      false
    end

    def well?
      false
    end

  end
end
