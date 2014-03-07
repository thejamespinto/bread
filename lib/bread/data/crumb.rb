module Bread
  class Crumb < Hash

    def initialize(controller, title, path, options)
      self.controller = controller
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
      controller.view_context.current_page? path
    end

    private

    attr_accessor :controller

  end
end
