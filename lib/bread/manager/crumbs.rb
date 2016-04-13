module Bread
  class Manager
    class Crumbs

      def crumbs_for(controller, crumbset)
        Bread.reload!
        crumb_scope = CrumbScope.new(controller)
        crumb_blocks_for(crumbset).each do |bl|
          crumb_scope.instance_eval(&bl)
        end
        append_first_and_last(crumb_scope.crumbset)
      end





      private

          def crumb_blocks_for(crumbset)
            crumbset.map { |token| top_scope.get_crumb_block(token) }
          end

          def append_first_and_last(crumbs)
            crumbs.first[:_first] = true
            crumbs.last[:_last] = true
            crumbs
          end

          def top_scope
            Bread.configuration
          end

    end
  end
end
