module Bread
  class Manager
    class Actions

      def config(&block)
        @top_scope = TopScope.new
        @top_scope.instance_eval(&block)
      end

      def get_crumbset(controller_path, action_name)
        reload
        @top_scope.get_controller_scope(controller_path).get_crumbset(action_name)
      end







      private

          def reload
            config_file = Rails.root.join "app/lib/bread/actions.rb"
            unless File.exists? config_file
              #`rails g bread:install`
              raise "should have config actions file"
            end

            load(config_file)
            self
          end


    end
  end
end
