module Bread
  class Manager
    class Crumbs



      def config(&block)
        @top_scope = TopScope.new
        @top_scope.instance_eval(&block)
      end

      def crumbs_for(controller, crumbset)
        reload
        crumb_scope = CrumbScope.new(controller)
        crumb_blocks_for(crumbset).each do |bl|
          crumb_scope.instance_eval(&bl)
        end
        append_first_and_last(crumb_scope.crumbset)
      end





      private

          def crumb_blocks_for(crumbset)
            crumbset.map { |token| @top_scope.get_crumb_block(token) }
          end
          
          def append_first_and_last(crumbs)
            crumbs.first[:_first] = true
            crumbs.last[:_last] = true
            crumbs
          end

          def reload
            config_file = Rails.root.join "app/lib/bread/crumbs.rb"
            unless File.exists? config_file
              #`rails g bread:install`
              raise "should have config crumbs file"
            end

            load(config_file)
            self
          end



    end
  end
end
