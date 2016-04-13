require_relative 'configuration/scope'

module Bread
  class Configuration
    def initialize
      @controllers, @crumbs = {}, {}
    end

    def filter_blocks(view)
      keys = self[view.controller_path][view.action_name].keys
      keys.map do |key|
        crumbs[key] || raise("no crumb block for: :#{key}")
      end
    end

    def controller(controller_path, options={}, &block)
      scope = build_scope(controller_path.to_s, options)
      scope.instance_eval(&block)
    end

    def crumb(key, &block)
      crumbs[key] = block
    end

    private

    attr_reader :controllers, :crumbs

    def [](controller_path)
      controllers[controller_path.to_s] || raise("no controller #{controller_path} in #{controllers.keys}")
    end

    def build_scope(controller_path, options)
      controllers[controller_path] = Scope.new(self, controller_path, options)
    end

  end
end
