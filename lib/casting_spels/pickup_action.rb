module CastingSpels
  class PickupAction
    attr_writer :parent
    
    def handle?(command)
      return true if command[0] == "pickup"
    end

    def process(command)
      fail "PickupAction needs a parent." unless @parent
      object = @parent.location.drop(command[1])
      @parent.take(object)
      @parent.show_inventory
    end
  end
end
