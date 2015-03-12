module Bread
  class Reloader    
    include Singleton

    def initialize
      @files   = Dir["#{Rails.root}/app/lib/bread/*"]
      @checker = ActiveSupport::FileUpdateChecker.new(@files) do
        @files.each { |f| load f }
        puts "  Bread has reloaded!".light_blue
      end
    end
 
    def reload!
      return unless Rails.env.development?
      @checker.execute if updated?
    end

    private

    def updated?
      if @started
        @checker.updated?
      else
        @started = true
      end
    end

  end
end
