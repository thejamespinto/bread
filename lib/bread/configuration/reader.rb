module Bread
  class Configuration
    class Reader

      def crumbs_for(controller, crumbset)
        Bread.reload!
        crumb_scope = Scopes::Crumb.new(controller)
        crumb_blocks_for(crumbset).each do |bl|
          crumb_scope.instance_eval(&bl)
        end
        append_first_and_last(crumb_scope.crumbset)
      end





      private

          def crumb_blocks_for(crumbset)
            crumbset.map { |token| top_scope.crumbs[token] || raise("no crumb block for: :#{token}") }
          end

          def append_first_and_last(crumbs)
            crumbs.first.first!
            crumbs.last.last!
            crumbs
          end

          def top_scope
            Bread.configuration
          end

    end
  end
end
