module Bread
  class Configuration
    class Scope

      attr_reader :top_scope, :parent_crumbs

      def initialize(top_scope, controller_path, options)
        @top_scope, @controller_path, @options = top_scope, controller_path, options

        init_define_parent_crumbs
        init_raise_if_any_invalid_option
        init_prepend_default_alias_actions
      end

      def alias_actions(action_name, *alias_names)
        alias_names.each do |object|
          aliases[object.to_s] = action_name.to_s
        end
      end

      def actions(*action_names, &block)
        action_names.each do |action_name|
          action_scope = build_action_scope(action_name.to_s)
          action_scope.instance_eval(&block)
        end
      end

      def [](action_name)
        _read_action(aliased(action_name))
      end

      private

      attr_reader :controller_path, :options

      def build_action_scope(action_name)
        action_scopes[action_name] = Action.new(self, action_name)
      end

      def aliases
        @aliases ||= {}
      end

      def action_scopes
        @action_scopes ||= {}
      end

      def aliased(action_name)
        aliases[action_name] || action_name
      end

      def _read_action(action_name)
        action_scopes[action_name] || raise("no action scope for #{controller_path}#'#{action_name}'")
      end

      def init_prepend_default_alias_actions
        alias_actions :new,   :create
        alias_actions :edit,  :update, :destroy
      end

      def init_define_parent_crumbs
        @parent_crumbs = options[:parent_crumbs] || []
        raise "parent_crumbs must be an Array ----> controller(:#{controller_path})" if !@parent_crumbs.is_a?(Array)
      end

      def init_raise_if_any_invalid_option
        invalid_option = (options.keys - [:parent_crumbs]).first
        raise "Invalid option :#{invalid_option} ----> controller(:#{controller_path}, #{invalid_option}: '...') do" if invalid_option
      end

      class Action

        def initialize(controller_scope, action_name)
          @controller_scope, @action_name = controller_scope, action_name
          crumbs(controller_scope.parent_crumbs)
        end

        def crumbs(*symbols)
          (keys << symbols).flatten!
        end

        def keys
          @keys ||= []
        end

      end
    end
  end
end
