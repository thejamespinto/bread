module Bread
  class Configuration
    class Reader

      def initialize(controller)
        @controller = controller
      end

      def read
        crumb_keys   = Bread.configuration.for_controller(c.controller_path).crumb_keys_for_action(c.action_name)
        crumb_blocks = Bread.configuration.crumbs_for_keys(crumb_keys)
        crumb_scope  = Scopes::Crumb.new(controller)

        crumb_blocks.each do |bl|
          crumb_scope.instance_eval(&bl)
        end

        crumb_scope.read
      end

      private

      attr_reader :controller
      alias :c :controller

    end
  end
end
