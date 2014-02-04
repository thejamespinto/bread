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
      cmd = ControllerLayoutCommand.new(self)
      cmd.instance_eval(&self.class.bread_block)
      cmd.keys
    end

  end
end

if defined? ActionController::Base
  ActionController::Base.class_eval do
    include Bread::Controller
  end
end