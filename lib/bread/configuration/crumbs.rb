module Bread
  class Configuration
    module Crumbs

      def crumb(token, &block)
        crumbs[token] = block
        true
      end

      def crumbs
        @crumbs ||= {}
      end

    end
  end
end
