require_relative '../lib/casting_spels/inventory'

describe Inventory do
  it "shows current inventory keys" do
    items = { :item1 => "description 1",
              :item2 => "description 2" }
    expect(show_inventory).to eq([:item1,:item2])
  end

end
