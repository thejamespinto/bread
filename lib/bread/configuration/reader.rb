module Bread
  class Configuration
    class Reader

      def initialize(controller)
        @controller = controller
      end

      def read
        crumb_blocks.each do |bl|
          crumb_scope.instance_eval(&bl)
        end

        crumb_scope.read
      end



      private

      attr_reader :controller
      alias :c :controller

      def crumb_scope
        @crumb_scope ||= Scopes::Crumb.new(controller)
      end

      def crumb_keys
        @crumb_keys ||= configuration.for_controller(c.controller_path).for_action(c.action_name)
      end

      def crumb_blocks
        crumb_keys.map { |key| configuration.crumbs[key] || raise("no crumb block for: :#{key}") }
      end

      def configuration
        Bread.configuration
      end

    end
  end
end
