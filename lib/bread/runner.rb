module Bread
  class Runner

    def initialize(view)
      Bread.reload!
      @view = view
    end

    def run
      eval_blocks_on_view
      after_run
    end

    private

    def eval_blocks_on_view
      blocks.each do |block|
        @view.instance_eval(&block)
      end
    end

    def blocks
      controller_scope = Bread.configuration.read_controller(@view.controller_path)
      action_scope     = controller_scope.read_action(@view.action_name)
      keys             = action_scope.keys
      Bread.configuration.crumbs_for_keys(keys)
    end

    def after_run
      @view.send(:bread_array).first.first!
      @view.send(:bread_array).last.last!
    end

  end
end
