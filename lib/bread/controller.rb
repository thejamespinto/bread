module Bread
  module Controller
    extend ActiveSupport::Concern

    module ClassMethods
      attr_reader :bread_block
      def bread(&block)
        @bread_block = block
      end
    end

    def bread_keys
      block = self.class.bread_block
      if block.nil?
        puts "breadcrumbs: HEY! write some breadcrumbs for #{controller_name}##{action_name}".black.on_light_yellow
        return []
      end
      cmd = ControllerLayoutCommand.new(self)
      cmd.instance_eval(&block)
      cmd.keys
    end

  end
end

if defined? ActionController::Base
  ActionController::Base.class_eval do
    include Bread::Controller
  end
end