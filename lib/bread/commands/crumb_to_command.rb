module Bread
  class CrumbToCommand

    include ActionDispatch::Routing::UrlFor

    attr_reader :crumb

    def initialize(controller, key, &block)
      @key = key

      IvarsCommand.new(controller).ivars.each do |key, ivar|
        instance_variable_set(key, ivar)
      end

      instance_eval(&block)
    end

    def crumb_to(title, path, options={})
      @crumb = Crumb.new(options)
    end

  end
end