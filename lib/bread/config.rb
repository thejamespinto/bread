module Bread
  class Config
    include Singleton

    attr_reader :crumb_definitions

    def reload!
      config_file = Rails.root.join "config/breadcrumbs.rb"
      if File.exists? config_file
        load config_file
      else
        puts "ACHEI NAO".on_red
        # `rails g bread:install`
        # self.reload!
      end
    end

    def config(&block)
      cmd = ConfigCommand.new
      cmd.instance_eval(&block)
      @crumb_definitions = cmd.crumb_definitions
    end






  end
end
