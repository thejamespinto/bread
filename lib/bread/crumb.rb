module Bread
  class Crumb < Hash

    def initialize(context, title, path, options)
      self.context = context
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

    def first?
      self[:_first]
    end

    def last?
      self[:_last]
    end

    def current?
      context.current_page? path
    end

    private

    attr_accessor :context

  end
end
