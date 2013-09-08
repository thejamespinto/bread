module Bread
  module Controller
    extend ActiveSupport::Concern

    module ClassMethods
      attr_reader :bread_block
      def bread(&block)
        @bread_block = block
        before_filter :execute_bread_command
      end
    end

    attr_accessor :_bread_trees

    def _bread_trees
      @_bread_trees ||= {}
    end

    def execute_bread_command
      Command.new(self).instance_eval(&self.class.bread_block)
    end

  end
end

if defined? ActionController::Base
  ActionController::Base.class_eval do
    include Bread::Controller
  end
end