require_relative 'casting_spels/room'
require_relative 'casting_spels/basic_item'

require_relative 'casting_spels/walk_action'
require_relative 'casting_spels/pickup_action'
require_relative 'casting_spels/look_action'
require_relative 'casting_spels/weld_action'

require_relative 'casting_spels/player'

module CastingSpels
  def self.play
    setup_game
    while command = gets().strip.split(" ")
      @player.check_actions(command)
      @player.location.check_actions(command)
      puts "Inventory: #{@player.show_inventory}"
    end
  end

  def self.setup_game
    build_living_room
    build_garden
    build_attic
    map_exits
    setup_player
  end

  def self.build_living_room
    bucket       = BasicItem.new( "bucket", "an empty bucket" )
    bottle       = BasicItem.new( "bottle", "an empty bottle of whiskey" )
    @living_room = Room.new( "living room",
                            "A livingroom complete with a sleeping wizard.",
                            [:wizard], bucket, bottle )
  end

  def self.build_garden
    frog    = BasicItem.new( "frog", "a croaking green frog" )
    chain   = BasicItem.new( "chain", "an old chain" )
    @garden = Room.new( "garden", "A nice garden with a well",
                        [:well], frog, chain )
  end

  def self.build_attic
    @attic = CastingSpels::Room.new( "attic", "a musty attic", [:welder] )
  end

  def self.map_exits
    @garden.add_exit(      :west,       @living_room )
    @attic.add_exit(       :downstairs, @living_room )
    @living_room.add_exit( :east,       @garden )
    @living_room.add_exit( :upstairs,   @attic )
  end
p
  def self.setup_player
    @player = Player.new(@living_room)
    @player.add_action(WalkAction.new)
    @player.add_action(PickupAction.new)
    @attic.add_action(WeldAction.new(@player))
  end
end
