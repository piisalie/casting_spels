module CastingSpels
  class WelderItem
    def can_weld?(item)
      if item.to_s == "chain"
        true
      elsif item.to_s == "bucket"
        true
      else
        false
      end
    end

    def weld(item1,item2)
      item1.weld
      item2.weld
    end
    
    def to_s
      "welder"
    end
    
    def inspect
      "an old welder; it appears to still be functional"
    end
  end
end
