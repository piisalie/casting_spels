require_relative 'casting_spels/room'
require_relative 'casting_spels/item'

garden = CastingSpels::Room.new("garden",
                               "A nice garden with a well",
                               [ CastingSpels::Item.new("frog", "a croaking green frog"),
                                 CastingSpels::Item.new("chain", "an old chain", true) ],
                               [:well], [:east])

p garden
