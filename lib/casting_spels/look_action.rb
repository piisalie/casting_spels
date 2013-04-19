module CastingSpels
  class LookAction
    attr_writer :parent
    
    def handle?(command)
      return true if command[0] == "look"
    end

    def process(command)
      puts @parent.description + " Items: #{@parent.show_inventory}"
    end
  end
end
