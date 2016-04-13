module Bread
  class Configuration
    module Scopes
      class Controller

        attr_reader :top_scope, :parent_crumbs

        def initialize(top_scope, controller_path, options)
          @top_scope, @controller_path, @options = top_scope, controller_path, options

          define_parent_crumbs
          raise_if_any_invalid_option
          prepend_default_alias_actions
        end

        def alias_actions(action_name, *alias_names)
          alias_names.each do |a|
            aliases[a.to_s] = action_name.to_s
          end
        end

        def get_crumbset(action_name)
          action_name = get_aliased_action_name(action_name)
          action_scope = action_scopes[action_name] || raise("no action scope for #{controller_path}#'#{action_name}'")
          action_scope.crumbset
        end

        def actions(*action_names, &block)
          action_names.each do |action_name|
            action_name = action_name.to_s
            action_scopes[action_name] = action_scope = Scopes::Action.new(self, action_name)
            action_scope.instance_eval(&block)
          end
          true
        end





        private

        attr_reader :controller_path, :options

        def aliases
          @aliases ||= {}
        end

        def action_scopes
          @action_scopes ||= {}
        end

        def get_aliased_action_name(action_name)
          aliases[action_name] || action_name
        end

        def prepend_default_alias_actions
          alias_actions :new,   :create
          alias_actions :edit,  :update, :destroy
        end

        def define_parent_crumbs
          @parent_crumbs = options[:parent_crumbs] || []
          raise "parent_crumbs must be an Array ----> controller(:#{controller_path})" if !@parent_crumbs.is_a?(Array)
        end

        def raise_if_any_invalid_option
          invalid_option = (options.keys - [:parent_crumbs]).first
          raise "Invalid option :#{invalid_option} ----> controller(:#{controller_path}, #{invalid_option}: '...') do" if invalid_option
        end

      end
    end
  end
end
