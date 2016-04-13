module Bread
  class Configuration
    module Crumbs

      def crumb(key, &block)
        crumbs[key] = block
        true
      end

      def crumbs_for_keys(keys)
        keys.map do |key|
          crumbs[key] || raise("no crumb block for: :#{key}")
        end
      end

      private

      def crumbs
        @crumbs ||= {}
      end

    end
  end
end
