require_relative 'casting_spels/bucket_item'
require_relative 'casting_spels/chain_item'
require_relative 'casting_spels/whiskey_bottle_item'
require_relative 'casting_spels/frog_item'

require_relative 'casting_spels/room'
require_relative 'casting_spels/living_room'
require_relative 'casting_spels/attic_room'
require_relative 'casting_spels/garden_room'

require_relative 'casting_spels/player.rb'

module CastingSpels
  def self.parse(line)
    words = line.split(" ").map { |word| word.downcase }
    case words[0]
    when "look"
      @player.look
    when "walk"
      @player.walk(words[1])
    when "pickup"
      @player.pickup(words[1])
    when "inventory"
      @player.show_inventory
    when "weld"
      @player.weld(words[1], words[2])
    when "dunk"
      @player.dunk(words[1])
    when "splash"
      @player.splash
    when "exit"
      exit
    end
  end
  
  def self.play
    system "clear"
    @player = Player.new
    @player.look
    while line = gets().strip
      parse(line)
    end
  end
end

  
