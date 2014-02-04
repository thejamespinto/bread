module Bread
  class ConfigCommand

    attr_reader :crumb_definitions

    def initialize
      @crumb_definitions = {}
    end

    def key(key_name, &block)
      @crumb_definitions[key_name] = block
    end

  end
end