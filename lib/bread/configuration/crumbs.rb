module Bread
  class Configuration
    module Crumbs

      def crumb(key, &block)
        crumbs[key] = block
        true
      end

      def crumbs
        @crumbs ||= {}
      end

      def crumb_for_key(key)
        crumbs[key] || raise("no crumb block for: :#{key}")
      end

    end
  end
end
