module Bread
  module View
    def crumb_to(text, path, options={})
      bread_array << Bread::Crumb.new(controller, text, path, options)
    end

    def bread
      bread_array.any? or Bread::Runner.new(self).run
      bread_array
    end

    private

    def bread_array
      @_bread_array ||= []
    end
  end
end

if defined? ActionView::Base
  ActionView::Base.class_eval do
    include Bread::View
  end
end
