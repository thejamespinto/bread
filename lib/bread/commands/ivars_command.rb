module Bread
  class IvarsCommand

    attr_reader :ivars

    def initialize(target)
      @ivars = {}

      ivars_keys = target.instance_variables.select { |key| not key.to_s.starts_with?('@_') }
      ivars_keys.each do |key|
        @ivars[key] = target.instance_variable_get(key)
      end
    end

  end
end