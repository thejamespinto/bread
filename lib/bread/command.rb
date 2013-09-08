module Bread
  class Command
    
    def initialize(controller)
      @controller = controller
      @controller._bread_trees = {}
    end

    def action(action_name, &block)
      parent_name = nil
      action_name, parent_name = action_name.first if action_name.is_a? Hash
      @controller._bread_trees[action_name] = {block: block, parent: @controller._bread_trees[parent_name]}
    end

  end
end