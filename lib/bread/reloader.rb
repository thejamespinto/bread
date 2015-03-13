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
      @checker.execute if updated?
    end

    private

    def updated?
      if not @started
        @started = true
      elsif not Rails.env.development?
        @checker.updated?
      else
        false
      end
    end

  end
end
