module CastingSpels
  class BasicItem
    def initialize(name, description)
      @name, @description = name, description
    end

    attr_accessor :name, :description

  end
end
