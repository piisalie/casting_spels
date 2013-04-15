module Inventory
  def show_inventory
    @items.keys
  end
  
  def take(item)
    @items[item.name.to_sym] = item
  end

  def drop(item)
    return_item = @items[item.name.to_sym]
    @items.delete(item.name.to_sym)
    return_item
  end
end
