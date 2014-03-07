module Bread
  class Manager
    class Actions
      class ControllerScope
        
        attr_reader :top_scope, :parent_crumbs

        def initialize(top_scope, controller_name, options)
          @top_scope = top_scope
          @controller_name = controller_name
          @action_scopes = {}
          @aliases = {}
          @options = options
          define_parent_crumbs
          raise_if_any_invalid_option
          prepend_default_alias_actions
        end

        def alias_actions(action_name, *aliases)
          aliases.each do |a|
            @aliases[a.to_s] = action_name.to_s
          end
        end

        def get_crumbset(action_name)
          action_name = get_aliased_action_name(action_name)
          action_scope = @action_scopes[action_name] || raise("no action scope for '#{action_name}'")
          action_scope.crumbset
        end

        def actions(*action_names, &block)
          action_names.each { |action_name| action(action_name, &block) }
        end

        def action(action_name, &block)
          action_name = action_name.to_s
          @action_scopes[action_name] = action_scope = ActionScope.new(self, action_name)
          action_scope.instance_eval(&block)
          true
        end



        

        private

            def get_aliased_action_name(action_name)
              @aliases[action_name] || action_name
            end

            def prepend_default_alias_actions
              alias_actions :new,   :create
              alias_actions :edit,  :update, :destroy
            end

            def define_parent_crumbs
              @parent_crumbs = @options[:parent_crumbs] || []
              raise "parent_crumbs must be an Array ----> controller(:#{controller_name})" if !@parent_crumbs.is_a?(Array)
            end

            def raise_if_any_invalid_option
              invalid_option = (@options.keys - [:parent_crumbs]).first
              raise "Invalid option :#{invalid_option} ----> controller(:#{controller_name}, #{invalid_option}: '...') do" if invalid_option
            end
      end
    end
  end
end
