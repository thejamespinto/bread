module Bread
  class Crumb < Hash

    def initialize(context, title, path, options)
      @context = context
      options.merge(title: title, path: path).each do |k, v|
        self[k] = v
      end
    end

    def title
      self[:title]
    end

    def path
      self[:path]
    end

    def current?
      @context.current_page? path
    end

  end
end
