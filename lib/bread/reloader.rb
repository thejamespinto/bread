module Bread
  class Reloader < ActiveSupport::FileUpdateChecker

    alias :reload! :execute_if_updated

    def initialize(path)
      load path
      super([path]) do
        load path
        puts "#{path} has reloaded!".light_blue
      end
    end

  end
end
