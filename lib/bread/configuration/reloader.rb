module Bread
  class Configuration
    class Reloader

      def reload!
        if updated?
          checker.execute
        end
      end

      private

      def checker
        @checker ||= begin
          str = 'config/breadcrumbs.rb'
          path = Rails.root.join(str)
          ActiveSupport::FileUpdateChecker.new([path]) do
            load path
            puts "  #{str} has reloaded!".light_blue
          end
        end
      end

      def updated?
        if not @started
          @started = true
        elsif not Rails.env.development?
          checker.updated?
        else
          false
        end
      end

    end
  end
end
