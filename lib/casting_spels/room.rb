module CastingSpels
  class Room
    
    def take(item)
      object = nil
      @items.each { |obj| object = obj if obj.to_s == item }
      @items.delete_if { |obj| obj.to_s == item } if object
      return object if object
    end

    def move?(direction)
      @exits.include?(direction)
    end
  end
end
