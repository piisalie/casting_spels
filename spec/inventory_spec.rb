require_relative '../lib/casting_spels/inventory'

class ItemHolder
  include Inventory
  attr_reader :items
end

describe Inventory do
  it "puts an item into the inventory" do
    item_holder = ItemHolder.new
    item_holder.take(stub(name: :item1))
    expect(item_holder.items[:item1]).to be_true
  end

end
