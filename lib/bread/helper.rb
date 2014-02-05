module Bread
  module Helper

    def bread
      Config.instance.reload! # if should_reload?

      crumb_definitions = Config.instance.crumb_definitions
      keys_for_current_action = controller.bread_keys

      @crumbs = []
      keys_for_current_action.map do |key|
        crumbs_to_block = crumb_definitions[key] || :crumb_definitions_not_found
        self.instance_eval(&crumbs_to_block)
      end
      @crumbs = determinate_first_and_last(@crumbs)
      @crumbs
    end

    def crumb_to(title, path, options={})
      @crumbs << Crumb.new(self, title, path, options)
    end

    private

    def determinate_first_and_last(crumbs)
      crumbs.first[:_first] = true
      crumbs.last[:_last] = true
      crumbs
    end

  end
end

if defined? ActionView::Base
  ActionView::Base.class_eval do
    include Bread::Helper
  end
end