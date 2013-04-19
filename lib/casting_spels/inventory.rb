module Inventory
  def show_inventory
    @items.keys
  end
  
  def take(item)
    @items[item.name.to_sym] = item
  end

  def drop(item)
    if !@items[item.to_sym]
      puts "#{item} doesn't exist"
    else
      return_item = @items[item.to_sym]
      @items.delete(item.to_sym)
      return_item
    end
  end
end
