module CastingSpels
  class Noun
    def initialize(name, description)
      @name, @description = name, description
    end

    attr_accessor :name, :description

  end
end
